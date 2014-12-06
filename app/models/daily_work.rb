# coding: utf-8
class DailyWork < ActiveRecord::Base

  include Garage::Representer
  include Garage::Authorizable
  include AttendanceCalcService

  has_many :work
  belongs_to :unit_mission
  belongs_to :monthly_record

  def initialize
    @works = {}
    @resource = []
    @date = ""
  end

  # 出勤したか判定
  # @return [boolean] 作業種別が1(出勤)、2(有給)、3(夏期休暇)の場合はtrueを返却
  def paid?
    self.status == WorkStatus::ATTENDANCE or
      self.status == WorkStatus::SUMMER_VACATION or
      self.status == WorkStatus::PAID_VACATION
  end

  # 月単位の週報をユーザによって取得する
  def find_by_date_and_user

    sdate = Date.new(2014,11,1)
    edate = sdate.end_of_month

    @date = sdate
    
    @resources = DailyWork.joins({:unit_mission => :mission}, {:work => :unit_mission})
                 .select("daily_works.id, works.title, daily_works.target_date, daily_works.start_time, daily_works.end_time, daily_works.rest_time, daily_works.status, works.contents, works.work_time as contents_work_time, missions.id as mission_id, missions.title as mission_title").where(target_date: [sdate .. edate]).order(:target_date)
  end

  # 全ての週報を取得する
  def find_joins_all
    @resources = DailyWork.joins({:unit_mission => :mission})
                 .select("*").order(:target_date).all
  end

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end

  def json_format

    prevDate = ""
    
    @resources.each do |resource|

      if prevDate != resource.target_date.to_s
        prevDate = resource.target_date.to_s
        @works[resource.target_date.to_s] = {
          status: {},
          contents: []
        }
      end

      @works[resource.target_date.to_s][:status] = {
        id: resource.id,
        target_date: resource.target_date,
        start_time: resource.start_time.strftime("%H:%M"),
        end_time: resource.end_time.strftime("%H:%M"),
        rest_time: resource.rest_time,
        work_time: calc_work_time(resource.start_time, resource.end_time, resource.rest_time),
        status: resource.status
      }
      
      @works[resource.target_date.to_s][:contents].push({
        mission_id: resource.mission_id,
        mission_title: resource.mission_title,
        work_title: resource.title,
        work_contents: resource.contents,
        work_time: resource.contents_work_time
      });
      
    end

    {
      date: @date,
      works: @works
    }
    
  end
  
end


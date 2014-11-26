# coding: utf-8
class DailyWork < ActiveRecord::Base

  include Garage::Representer
  include Garage::Authorizable
  include AttendanceCalcService

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
    
    @resources = DailyWork.joins({:unit_mission => :mission})
                 .select("*").where(target_date: [sdate .. edate]).order(:target_date)
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
        @works[resource.target_date.to_s] = []
      end

      @works[resource.target_date.to_s].push(resource)
      
    end

    {
      date: @date,
      works: @works
    }
    
  end
  
end


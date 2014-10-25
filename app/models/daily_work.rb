# coding: utf-8
class DailyWork < ActiveRecord::Base

  attr_accessor :id, :user_id, :unit_mission_id,
                :start_time, :end_time, :type, :contents, :memo

#  belongs_to :unit_mission

  # 出勤したか判定
  # @return 作業種別が1(出勤)、2(有給)、3(夏期休暇)の場合はtrueを返却
  def paid?
    type == WorkType::ATTENDANCE or
      type == WorkType::SUMMER_VACATION or
      type == WorkType::PAID_VACATION
  end

  

end

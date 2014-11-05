# coding: utf-8
class DailyWork < ActiveRecord::Base

  belongs_to :unit_mission
  belongs_to :monthly_record

  # 出勤したか判定
  # @return [boolean] 作業種別が1(出勤)、2(有給)、3(夏期休暇)の場合はtrueを返却
  def paid?
    self.status == WorkStatus::ATTENDANCE or
      self.status == WorkStatus::SUMMER_VACATION or
      self.status == WorkStatus::PAID_VACATION
  end

end

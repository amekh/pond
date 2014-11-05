# coding: utf-8
class MonthlyRecord < ActiveRecord::Base

  has_many :daily_work
  belongs_to :user

  # 深夜残業時間
  attr_accessor :work_time, :over_time, :late_time
  
  # 雑給+福利を計算して取得する
  # @return [int] 雑給+福利
  def get_miscellany_salary
    ( self.welfare + self.salary ) * MISCELLANY_SALARY_RATE
  end

  # 算定基礎額を計算して取得する
  # @return [int] 算定基礎額
  def get_calc_basis_amount
    ( self.salary / CALC_BASIS_AMOUNT_RATE ).truncate
  end

  # 個人負担経費を計算して取得する
  # @return [int] 個人負担経費
  def get_unit_outlay
    ( self.welfare + self.salary ) * BURDEN_UNIT_OUTLAY_RATE
  end

end

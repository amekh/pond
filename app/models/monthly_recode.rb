# coding: utf-8
class MonthlyRecode < ActiveRecord::Base

  belongs_to :user

  # 雑給+福利を計算して取得する
  # @return [int] 雑給+福利
  def get_miscellany_salary
    ( @welfare + @salary ) * MISCELLANY_SALARY_RATE
  end

  # 算定基礎額を計算して取得する
  # @return [int] 算定基礎額
  def get_calc_basis_amount
    ( @salary / CALC_BASIS_AMOUNT_RATE ).truncate
  end

  # 個人負担経費を計算して取得する
  # @return [int] 個人負担経費
  def get_unit_outlay
    ( @welfare + @salary ) * BURDEN_UNIT_OUTLAY_RATE
  end
  
end

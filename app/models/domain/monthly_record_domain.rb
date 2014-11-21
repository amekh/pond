# coding: utf-8
# 月間実績のドメイン層を扱うクラス
#
class Domain::MonthlyRecordDomain

  include AttendanceCalcService
  
  attr_accessor :results, :over_time_pay, :late_time_pay, :sum_work_time,
                :sum_over_time, :sum_late_time, :basis_amount, :total_over_time_pay

  def initialize

    # 売上げ
    @profit = 0
    # 案件情報
    @mission = []
    # 普通残業代
    @over_time_pay = 0
    # 深夜残業代
    @late_time_pay = 0
    # 作業時間合計
    @sum_work_time = 0
    # 残業時間合計
    @sum_over_time = 0
    # 深夜残業時間合計
    @sum_late_time = 0
    # 休日作業時間
    @sum_holiday_work_time = 0
    # 算定基準
    @basis_amount = 0
    # 総残業時間合計
    @total_over_time_pay = 0

    @total_cost = 0

  end
  
  # 全ての計算を行う
  def find_all

    @results = MonthlyRecord.joins(:daily_work => {:unit_mission => :mission}).select("*");

    baseinfo = @results[0]

    @basis_amount = calc_basis_amount(baseinfo.salary);
    @salary = baseinfo.salary
    @allowance = baseinfo.allowance
    @outlay = baseinfo.outlay
    @carfare = baseinfo.carfare
    
    @results.each do |record|

      record.work_time = calc_work_time(record.start_time, record.end_time, 1)
      record.over_time = extra_over_work_time(record.start_time, record.end_time, 1)
      record.late_time = extra_late_over_work_time(record.target_date, record.start_time, record.end_time)
      record.holiday_work_time = 0
      
      @sum_work_time += record.work_time
      @sum_over_time += record.over_time
      @sum_late_time += record.late_time
      @sum_holiday_work_time += record.holiday_work_time

      @mission.push({
                      title: record.title,
                      start_date: record.start_date,
                      end_date: record.start_date + record.period,
                      unit_cost: record.unit_cost,
                      work_time: record.work_time,
                      over_work_time: record.over_time,
                      over_work_price: calc_over_time_pay(record.over_time, @basis_amount) +
                      calc_late_time_pay(record.late_time, @basis_amount) 
                    });

      @total_cost += record.unit_cost

    end

    @over_time_pay = calc_over_time_pay(@sum_over_time, @basis_amount)
    @late_time_pay = calc_late_time_pay(@sum_late_time, @basis_amount)

    #TODO 計算する
    @holiday_work_time_pay = 0
    @total_over_time_pay = @over_time_pay + @late_time_pay + @holiday_work_time_pay

    @profit = @total_cost + @total_over_time_pay
    
  end

  # jsonに整形する
  def json_format

    total_cost = @salary + @outlay + @carfare +
                 calc_welfare(@allowance, @salary) + @total_over_time_pay

    my_outlay = calc_unit_outlay(@salary, @allowance)

    gross_profit = @profit - total_cost
    operation_income = gross_profit - my_outlay
    
    
    {
      profit: @profit,
      total_cost: total_cost,
      gross_profit: gross_profit,
      operation_income: operation_income,
      rate_operation_income: ((operation_income / @profit)*100).round(1),
      salary: @salary,
      allowance: @allowance,
      welfare: calc_welfare(@allowance, @salary),
      trans_expenses: @carfare,
      outlay: @outlay,
      my_outlay: my_outlay,
      basic_rate: @basis_amount,
      total_over_work_time: @sum_over_time,
      total_late_work_time: @sum_late_time,
      total_holiday_work_time: @sum_holiday_work_time,
      over_work_hour_price: basis_amount * OVER_WORK_RATE,
      late_work_hour_price: basis_amount * LATE_WORK_RATE,
      holiday_work_hour_price: 0,
      total_over_work_price: @over_time_pay,
      total_late_work_price: @late_time_pay,
      total_holiday_work_price: @holiday_work_time_pay,
      total_all_over_work_price: @total_over_time_pay,

      mission: @mission,
    }
  end


  private

  # 残業代を計算する
  # @param [int] sum_over_time 合計残業時間
  # @return 残業代
  def calc_over_time_pay(sum_over_time, basis_amount)
    base_over_time = sum_over_time - BASE_OVER_WORK_TIME;

    if(base_over_time <= 0) then return 0 end
      
    (base_over_time * (basis_amount * OVER_WORK_RATE)).truncate;
  end

  # 深夜残業代を計算する
  # @param [int] sum_late_time 合計残業時間
  # @return 残業代
  def calc_late_time_pay(sum_late_time, basis_amount)
    (sum_late_time * (basis_amount * LATE_WORK_RATE)).truncate;
  end

  # 雑給+福利を計算して取得する
  # @param [int] welfare 経費
  # @param [int] salary 給与
  # @return [int] 雑給+福利
  def calc_welfare (allowance, salary)
      
    ( allowance + salary ) * MISCELLANY_SALARY_RATE
  end

  # 算定基礎額を計算して取得する
  # @param [int] salary 給与
  # @return [int] 算定基礎額
  def calc_basis_amount (salary)
    ( salary / CALC_BASIS_AMOUNT_RATE ).truncate
  end

  # 個人負担経費を計算して取得する
  # @param [int] allowance 手当
  # @param [int] salary 給与
  # @return [int] 個人負担経費
  def calc_unit_outlay (salary, allowance)
    ( salary + allowance ) * BURDEN_UNIT_OUTLAY_RATE
  end  
end

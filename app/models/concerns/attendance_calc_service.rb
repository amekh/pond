# coding: utf-8
module AttendanceCalcService

  include TimeUtil
  
  # 残業時間を抽出する
  # @param [String] start_time 開始時間
  # @param [String] end_time 終了時間
  # @return [float] 深夜残業時間
  def extra_over_work_time (start_time, end_time, rest_time)

    over_work_time = calc_work_time(start_time, end_time, rest_time) - BASE_WORK_TIME
    
    over_work_time < 0 ? 0 : over_work_time
  end

  # 作業時間を計算する
  # @param [String] start_time 開始時間
  # @param [String] end_time 終了時間
  # @return [float] 作業時間
  def calc_work_time (start_time, end_time, rest_time)
    ( end_time - start_time ) / ( 60 * 60 ) - rest_time
  end

  # 深夜作業時間を計算する
  # @param [String] target_date 対象日付
  # @param [String] start_time 開始時間
  # @param [String] end_time 終了時間
  # @return [float] 深夜作業時間
  def extra_late_over_work_time (target_date, start_time, end_time)
    
    late_over_work_start_time = to_time(target_date.strftime("%Y/%m/%d") + " " + "00:00") + BEGIN_LATE_WORK_TIME.hours
    late_over_work_end_time = to_time(target_date.strftime("%Y/%m/%d") + " " + "00:00") + END_LATE_WORK_TIME.hours

    # 深夜時間帯開始後に退勤した場合、深夜残業をつける
    if( end_time > late_over_work_start_time )

      late_over_work_start_time = start_time > late_over_work_start_time ?
                                    start_time : late_over_work_start_time

      late_over_work_end_time = end_time < late_over_work_end_time ?
                                  end_time : late_over_work_end_time

      
      
      return ( late_over_work_end_time - late_over_work_start_time ) / ( 60 * 60 )
    end

    return 0

  end

end

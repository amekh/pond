# coding: utf-8

module TimeUtil

  # 文字列時間をTime型に変換する
  # @param [string] time 文字列時間
  # @return [Time] 時間
  def to_time (time)
    Time.parse(time)
  end
end

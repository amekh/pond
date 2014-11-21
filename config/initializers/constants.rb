# coding: utf-8

# 休憩時間の基準
BASE_RATE_TIME = 1.0

# 労働基準時間
BASE_WORK_TIME = 8.0

# 基準外労働時間
BASE_OVER_WORK_TIME = 30.0

# 深夜労働開始時間(h)
BEGIN_LATE_WORK_TIME = 22.0

# 深夜労働終了時間(h)
END_LATE_WORK_TIME = 29.0

# 法定福利費 + 雑給の割合 
MISCELLANY_SALARY_RATE = 0.165

# 個人負担経費
BURDEN_UNIT_OUTLAY_RATE = 0.620

# 算定基礎額の割合
CALC_BASIS_AMOUNT_RATE = 197.4

# 普通残業の割合
OVER_WORK_RATE = 1.25

# 深夜残業の割合
LATE_WORK_RATE = 0.25

# 休日出勤の割合
HOLIDAY_WORK_RATE = 1.35

# 作業種別
module WorkStatus
  # 出勤
  ATTENDANCE = 1
  # 有給
  PAID_VACATION = 2
  # 夏期休暇
  SUMMER_VACATION = 3
  # 休暇
  DAY_OFF = 4
  # 代休
  STEAD_DAY_OFF = 5
  
end

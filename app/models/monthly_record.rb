# coding: utf-8
class MonthlyRecord < ActiveRecord::Base

  has_many :daily_work
  belongs_to :user

  attr_accessor :work_time, :over_time, :late_time, :holiday_work_time
  
end

# coding: utf-8
class MonthlyRecord < ActiveRecord::Base

  include Garage::Representer
  include Garage::Authorizable
  
  has_many :daily_work
  belongs_to :user

  attr_accessor :work_time, :over_time, :late_time, :holiday_work_time

  property :id
  property :titlte

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end
  
end

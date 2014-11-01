class UnitMission < ActiveRecord::Base
  
  belongs_to :mission
  has_many :daily_work
  
  
end

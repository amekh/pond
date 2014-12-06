class Work < ActiveRecord::Base

  belongs_to :daily_work
  belongs_to :unit_mission
  
end

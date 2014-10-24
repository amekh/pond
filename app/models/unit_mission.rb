class UnitMission < ActiveRecord::Base
  attr_accessor :id, :mission_id, :user_id, :unit_cost,
                :start_date, :period, :limit_over_cost_lower, :limit_over_cost_higher
  
  belongs_to :mission

  
  
end

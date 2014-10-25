class Mission < ActiveRecord::Base
  attr_accessor :id, :company_id, :mission_type_id, :title,
                :contents, :nes_work_time, :unnes_work_time_min,
                :unnes_work_time_max

  has_many :unit_mission
  belongs_to :company, :mission_type

  

end

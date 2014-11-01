class Mission < ActiveRecord::Base

  has_many :unit_mission

  belongs_to :mission_type
  belongs_to :company

end

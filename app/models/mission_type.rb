class MissionType < ActiveRecord::Base

  attr_accessor :id, :name
  
  has_many :mission

end

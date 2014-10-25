class Company < ActiveRecord::Base

  attr_accessor :id, :name
  
  has_many :mission

end

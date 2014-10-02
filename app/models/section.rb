# coding: utf-8
class Section < ActiveRecord::Base

  validates :name, presence: true
  validates :leader_user_id, numericality: true, presence: true

  def getName
    self.name + '課'
  end

end

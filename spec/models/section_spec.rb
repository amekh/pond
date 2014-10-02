# coding: utf-8
require 'rails_helper'

RSpec.describe Section, :type => :model do

  describe 'name' do
    before(:each) do
      @section = FactoryGirl.create(:section, name:"StartUp", leader_user_id:1);
    end
    
    it 'getName' do
      expect(@section.getName()).to eq("StartUp課")
    end
  end
end

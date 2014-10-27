# coding: utf-8
require 'rails_helper'

RSpec.describe DailyWork, :type => :model do

  before(:each) do
    @daily_work = FactoryGirl.create(:daily_work, status:1)
  end

  it 'paid? # statusが「出勤」の場合 true になること' do
    @daily_work = FactoryGirl.create( :daily_work, status:1 )
    expect( @daily_work.paid? ).to be_truthy
  end

  it 'paid? # statusが「有給」の場合 true になること' do
    @daily_work = FactoryGirl.create( :daily_work, status:2 )
    expect( @daily_work.paid? ).to be_truthy
  end

  it 'paid? # statusが「夏期休暇」の場合 true になること' do
    @daily_work = FactoryGirl.create( :daily_work, status:3 )
    expect( @daily_work.paid? ).to be_truthy
  end

  it 'paid? # statusが「休暇」の場合 false になること' do
    @daily_work = FactoryGirl.create( :daily_work, status:4 )
    expect( @daily_work.paid? ).to be_falsey
  end

  


end

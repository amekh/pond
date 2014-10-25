# coding: utf-8
require 'rails_helper'

RSpec.describe DailyWork, :type => :model do

  before(:each) do
    @daily_work = FactoryGirl.create(:daily_work, type:1)
  end

  it 'paid? # typeが「出勤」の場合 true になること' do
    @daily_work = FactoryGirl.create( :daily_work, type:1 )
    expect( @daily_work.paid? ).to be_truthy
  end

  it 'paid? # typeが「有給」の場合 true になること' do
    @daily_work = FactoryGirl.create( :daily_work, type:2 )
    expect( @daily_work.paid? ).to be_truthy
  end

  it 'paid? # typeが「夏期休暇」の場合 true になること' do
    @daily_work = FactoryGirl.create( :daily_work, type:3 )
    expect( @daily_work.paid? ).to be_truthy
  end

  it 'paid? # typeが「休暇」の場合 false になること' do
    @daily_work = FactoryGirl.create( :daily_work, type:4 )
    expect( @daily_work.paid? ).to be_falsey
  end

  


end

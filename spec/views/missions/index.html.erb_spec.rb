require 'rails_helper'

RSpec.describe "missions/index", :type => :view do
  before(:each) do
    assign(:missions, [
      Mission.create!(
        :company_id => 1,
        :mission_type => 2,
        :title => 3,
        :contents => 4,
        :nes_work_time => 5,
        :unnes_work_time_min => 6,
        :unnes_work_time_max => 7
      ),
      Mission.create!(
        :company_id => 1,
        :mission_type => 2,
        :title => 3,
        :contents => 4,
        :nes_work_time => 5,
        :unnes_work_time_min => 6,
        :unnes_work_time_max => 7
      )
    ])
  end

  it "renders a list of missions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end

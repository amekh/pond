require 'rails_helper'

RSpec.describe "unit_missions/index", :type => :view do
  before(:each) do
    assign(:unit_missions, [
      UnitMission.create!(
        :mission_id => 1,
        :user_id => 2,
        :unit_cost => 3,
        :period => 4,
        :limit_over_cost_lower => 5,
        :limit_over_cost_higher => 6
      ),
      UnitMission.create!(
        :mission_id => 1,
        :user_id => 2,
        :unit_cost => 3,
        :period => 4,
        :limit_over_cost_lower => 5,
        :limit_over_cost_higher => 6
      )
    ])
  end

  it "renders a list of unit_missions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end

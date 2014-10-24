require 'rails_helper'

RSpec.describe "unit_missions/edit", :type => :view do
  before(:each) do
    @unit_mission = assign(:unit_mission, UnitMission.create!(
      :mission_id => 1,
      :user_id => 1,
      :unit_cost => 1,
      :period => 1,
      :limit_over_cost_lower => 1,
      :limit_over_cost_higher => 1
    ))
  end

  it "renders the edit unit_mission form" do
    render

    assert_select "form[action=?][method=?]", unit_mission_path(@unit_mission), "post" do

      assert_select "input#unit_mission_mission_id[name=?]", "unit_mission[mission_id]"

      assert_select "input#unit_mission_user_id[name=?]", "unit_mission[user_id]"

      assert_select "input#unit_mission_unit_cost[name=?]", "unit_mission[unit_cost]"

      assert_select "input#unit_mission_period[name=?]", "unit_mission[period]"

      assert_select "input#unit_mission_limit_over_cost_lower[name=?]", "unit_mission[limit_over_cost_lower]"

      assert_select "input#unit_mission_limit_over_cost_higher[name=?]", "unit_mission[limit_over_cost_higher]"
    end
  end
end

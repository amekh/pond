require 'rails_helper'

RSpec.describe "unit_missions/show", :type => :view do
  before(:each) do
    @unit_mission = assign(:unit_mission, UnitMission.create!(
      :mission_id => 1,
      :user_id => 2,
      :unit_cost => 3,
      :period => 4,
      :limit_over_cost_lower => 5,
      :limit_over_cost_higher => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end

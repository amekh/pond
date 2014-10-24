require 'rails_helper'

RSpec.describe "mission_types/index", :type => :view do
  before(:each) do
    assign(:mission_types, [
      MissionType.create!(
        :name => "Name"
      ),
      MissionType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of mission_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

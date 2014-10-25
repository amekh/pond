require 'rails_helper'

RSpec.describe "daily_works/index", :type => :view do
  before(:each) do
    assign(:daily_works, [
      DailyWork.create!(
        :user_id => 1,
        :unit_mission => 2,
        :type => "",
        :contents => "MyText",
        :memo => "MyText"
      ),
      DailyWork.create!(
        :user_id => 1,
        :unit_mission => 2,
        :type => "",
        :contents => "MyText",
        :memo => "MyText"
      )
    ])
  end

  it "renders a list of daily_works" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

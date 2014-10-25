require 'rails_helper'

RSpec.describe "daily_works/show", :type => :view do
  before(:each) do
    @daily_work = assign(:daily_work, DailyWork.create!(
      :user_id => 1,
      :unit_mission => 2,
      :type => "",
      :contents => "MyText",
      :memo => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end

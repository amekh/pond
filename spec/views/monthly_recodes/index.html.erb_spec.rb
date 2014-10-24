require 'rails_helper'

RSpec.describe "monthly_recodes/index", :type => :view do
  before(:each) do
    assign(:monthly_recodes, [
      MonthlyRecode.create!(
        :user_id => 1,
        :samary => 2,
        :welfare => 3,
        :carfare => 4
      ),
      MonthlyRecode.create!(
        :user_id => 1,
        :samary => 2,
        :welfare => 3,
        :carfare => 4
      )
    ])
  end

  it "renders a list of monthly_recodes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end

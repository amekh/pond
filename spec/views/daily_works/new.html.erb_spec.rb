require 'rails_helper'

RSpec.describe "daily_works/new", :type => :view do
  before(:each) do
    assign(:daily_work, DailyWork.new(
      :user_id => 1,
      :unit_mission => 1,
      :type => "",
      :contents => "MyText",
      :memo => "MyText"
    ))
  end

  it "renders new daily_work form" do
    render

    assert_select "form[action=?][method=?]", daily_works_path, "post" do

      assert_select "input#daily_work_user_id[name=?]", "daily_work[user_id]"

      assert_select "input#daily_work_unit_mission[name=?]", "daily_work[unit_mission]"

      assert_select "input#daily_work_type[name=?]", "daily_work[type]"

      assert_select "textarea#daily_work_contents[name=?]", "daily_work[contents]"

      assert_select "textarea#daily_work_memo[name=?]", "daily_work[memo]"
    end
  end
end

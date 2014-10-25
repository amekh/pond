require 'rails_helper'

RSpec.describe "daily_works/edit", :type => :view do
  before(:each) do
    @daily_work = assign(:daily_work, DailyWork.create!(
      :user_id => 1,
      :unit_mission => 1,
      :type => "",
      :contents => "MyText",
      :memo => "MyText"
    ))
  end

  it "renders the edit daily_work form" do
    render

    assert_select "form[action=?][method=?]", daily_work_path(@daily_work), "post" do

      assert_select "input#daily_work_user_id[name=?]", "daily_work[user_id]"

      assert_select "input#daily_work_unit_mission[name=?]", "daily_work[unit_mission]"

      assert_select "input#daily_work_type[name=?]", "daily_work[type]"

      assert_select "textarea#daily_work_contents[name=?]", "daily_work[contents]"

      assert_select "textarea#daily_work_memo[name=?]", "daily_work[memo]"
    end
  end
end

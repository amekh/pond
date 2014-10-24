require 'rails_helper'

RSpec.describe "missions/new", :type => :view do
  before(:each) do
    assign(:mission, Mission.new(
      :company_id => 1,
      :mission_type => 1,
      :title => 1,
      :contents => 1,
      :nes_work_time => 1,
      :unnes_work_time_min => 1,
      :unnes_work_time_max => 1
    ))
  end

  it "renders new mission form" do
    render

    assert_select "form[action=?][method=?]", missions_path, "post" do

      assert_select "input#mission_company_id[name=?]", "mission[company_id]"

      assert_select "input#mission_mission_type[name=?]", "mission[mission_type]"

      assert_select "input#mission_title[name=?]", "mission[title]"

      assert_select "input#mission_contents[name=?]", "mission[contents]"

      assert_select "input#mission_nes_work_time[name=?]", "mission[nes_work_time]"

      assert_select "input#mission_unnes_work_time_min[name=?]", "mission[unnes_work_time_min]"

      assert_select "input#mission_unnes_work_time_max[name=?]", "mission[unnes_work_time_max]"
    end
  end
end

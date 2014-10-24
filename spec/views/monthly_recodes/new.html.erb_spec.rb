require 'rails_helper'

RSpec.describe "monthly_recodes/new", :type => :view do
  before(:each) do
    assign(:monthly_recode, MonthlyRecode.new(
      :user_id => 1,
      :samary => 1,
      :welfare => 1,
      :carfare => 1
    ))
  end

  it "renders new monthly_recode form" do
    render

    assert_select "form[action=?][method=?]", monthly_recodes_path, "post" do

      assert_select "input#monthly_recode_user_id[name=?]", "monthly_recode[user_id]"

      assert_select "input#monthly_recode_samary[name=?]", "monthly_recode[samary]"

      assert_select "input#monthly_recode_welfare[name=?]", "monthly_recode[welfare]"

      assert_select "input#monthly_recode_carfare[name=?]", "monthly_recode[carfare]"
    end
  end
end

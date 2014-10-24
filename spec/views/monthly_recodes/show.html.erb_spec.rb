require 'rails_helper'

RSpec.describe "monthly_recodes/show", :type => :view do
  before(:each) do
    @monthly_recode = assign(:monthly_recode, MonthlyRecode.create!(
      :user_id => 1,
      :samary => 2,
      :welfare => 3,
      :carfare => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end

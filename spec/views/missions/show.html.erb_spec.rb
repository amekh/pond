require 'rails_helper'

RSpec.describe "missions/show", :type => :view do
  before(:each) do
    @mission = assign(:mission, Mission.create!(
      :company_id => 1,
      :mission_type => 2,
      :title => 3,
      :contents => 4,
      :nes_work_time => 5,
      :unnes_work_time_min => 6,
      :unnes_work_time_max => 7
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
    expect(rendered).to match(/7/)
  end
end

require 'rails_helper'

RSpec.describe "mission_types/show", :type => :view do
  before(:each) do
    @mission_type = assign(:mission_type, MissionType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

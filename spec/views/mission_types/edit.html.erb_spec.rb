require 'rails_helper'

RSpec.describe "mission_types/edit", :type => :view do
  before(:each) do
    @mission_type = assign(:mission_type, MissionType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit mission_type form" do
    render

    assert_select "form[action=?][method=?]", mission_type_path(@mission_type), "post" do

      assert_select "input#mission_type_name[name=?]", "mission_type[name]"
    end
  end
end

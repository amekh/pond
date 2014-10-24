require 'rails_helper'

RSpec.describe "mission_types/new", :type => :view do
  before(:each) do
    assign(:mission_type, MissionType.new(
      :name => "MyString"
    ))
  end

  it "renders new mission_type form" do
    render

    assert_select "form[action=?][method=?]", mission_types_path, "post" do

      assert_select "input#mission_type_name[name=?]", "mission_type[name]"
    end
  end
end

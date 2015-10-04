require 'rails_helper'

RSpec.describe "studies/new", type: :view do
  before(:each) do
    assign(:study, Study.new(
      :name => "MyString",
      :language => nil
    ))
  end

  it "renders new study form" do
    render

    assert_select "form[action=?][method=?]", studies_path, "post" do

      assert_select "input#study_name[name=?]", "study[name]"

      assert_select "input#study_language[name=?]", "study[language]"
    end
  end
end

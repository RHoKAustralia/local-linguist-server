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

      assert_select "select#study_language_id[name=?]", "study[language_id]"
    end
  end
end

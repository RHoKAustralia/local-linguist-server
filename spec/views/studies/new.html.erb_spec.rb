require 'rails_helper'

RSpec.describe "studies/new", type: :view do
  before(:each) do
    assign(:study, Study.new(
      :name => "MyString",
      :start_date => DateTime.now
    ))
  end

  it "renders new study form" do
    render

    assert_select "form[action=?][method=?]", studies_path, "post" do

      assert_select "input#study_name[name=?]", "study[name]"

      assert_select "select#study_start_date_1i[name=?]", "study[start_date(1i)]"
      assert_select "select#study_start_date_2i[name=?]", "study[start_date(2i)]"
      assert_select "select#study_start_date_3i[name=?]", "study[start_date(3i)]"
    end
  end
end

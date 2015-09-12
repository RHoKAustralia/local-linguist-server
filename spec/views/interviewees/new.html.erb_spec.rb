require 'rails_helper'

RSpec.describe "interviewees/new", type: :view do
  before(:each) do
    assign(:interviewee, Interviewee.new(
      :name => "MyString",
      :mobile => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new interviewee form" do
    render

    assert_select "form[action=?][method=?]", interviewees_path, "post" do

      assert_select "input#interviewee_name[name=?]", "interviewee[name]"

      assert_select "input#interviewee_mobile[name=?]", "interviewee[mobile]"

      assert_select "input#interviewee_email[name=?]", "interviewee[email]"
    end
  end
end

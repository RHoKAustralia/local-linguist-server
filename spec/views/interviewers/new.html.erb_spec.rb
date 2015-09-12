require 'rails_helper'

RSpec.describe "interviewers/new", type: :view do
  before(:each) do
    assign(:interviewer, Interviewer.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new interviewer form" do
    render

    assert_select "form[action=?][method=?]", interviewers_path, "post" do

      assert_select "input#interviewer_name[name=?]", "interviewer[name]"

      assert_select "input#interviewer_email[name=?]", "interviewer[email]"
    end
  end
end

require 'rails_helper'

RSpec.describe "interviewers/edit", type: :view do
  before(:each) do
    @interviewer = assign(:interviewer, Interviewer.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit interviewer form" do
    render

    assert_select "form[action=?][method=?]", interviewer_path(@interviewer), "post" do

      assert_select "input#interviewer_name[name=?]", "interviewer[name]"

      assert_select "input#interviewer_email[name=?]", "interviewer[email]"
    end
  end
end

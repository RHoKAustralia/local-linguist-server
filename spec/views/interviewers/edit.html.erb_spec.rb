require 'rails_helper'

RSpec.describe "interviewers/edit", type: :view do
  before(:each) do
    @interviewer = assign(:interviewer, Interviewer.create!(
      :name => "MyString",
      :mobile => "MyString",
      :device_id => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit interviewer form" do
    render

    assert_select "form[action=?][method=?]", interviewer_path(@interviewer), "post" do

      assert_select "input#interviewer_name[name=?]", "interviewer[name]"

      assert_select "input#interviewer_mobile[name=?]", "interviewer[mobile]"

      assert_select "input#interviewer_device_id[name=?]", "interviewer[device_id]"

      assert_select "input#interviewer_email[name=?]", "interviewer[email]"
    end
  end
end

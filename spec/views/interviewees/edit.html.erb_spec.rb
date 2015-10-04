require 'rails_helper'

RSpec.describe "interviewees/edit", type: :view do
  before(:each) do
    @interviewee = assign(:interviewee, Interviewee.create!(
      :name => "MyString",
      :mobile => "MyString",
      :email => "MyString",
      :gender => "MyString",
      :occupation => "MyString",
      :education_level => "MyString"
    ))
  end

  it "renders the edit interviewee form" do
    render

    assert_select "form[action=?][method=?]", interviewee_path(@interviewee), "post" do

      assert_select "input#interviewee_name[name=?]", "interviewee[name]"

      assert_select "input#interviewee_mobile[name=?]", "interviewee[mobile]"

      assert_select "input#interviewee_email[name=?]", "interviewee[email]"

      assert_select "input#interviewee_gender[name=?]", "interviewee[gender]"

      assert_select "input#interviewee_occupation[name=?]", "interviewee[occupation]"

      assert_select "input#interviewee_education_level[name=?]", "interviewee[education_level]"
    end
  end
end

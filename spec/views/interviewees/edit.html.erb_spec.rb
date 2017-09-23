require 'rails_helper'

RSpec.describe "interviewees/edit", type: :view do
  before(:each) do
    @interviewee = assign(:interviewee, FactoryGirl.create(:interviewee))
  end

  it "renders the edit interviewee form" do
    render

    assert_select "form[action=?][method=?]", interviewee_path(@interviewee), "post" do

      assert_select "input#interviewee_name[name=?]", "interviewee[name]"

      assert_select "input#interviewee_mobile[name=?]", "interviewee[mobile]"

      assert_select "input#interviewee_email[name=?]", "interviewee[email]"

      assert_select "input#interviewee_gender[name=?]", "interviewee[gender]"

      assert_select "input#interviewee_age[name=?]", "interviewee[age]"

      assert_select "input#interviewee_locale_id[name=?]", "interviewee[locale_id]"

      assert_select "input#interviewee_occupation[name=?]", "interviewee[occupation]"

      assert_select "input#interviewee_education_level[name=?]", "interviewee[education_level]"
    end
  end
end

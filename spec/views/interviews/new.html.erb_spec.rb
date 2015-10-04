require 'rails_helper'

RSpec.describe "interviews/new", type: :view do
  before(:each) do
    assign(:interview, Interview.new(
      :study => nil,
      :interviewer => nil,
      :interviewee => nil,
      :locale => nil
    ))
  end

  it "renders new interview form" do
    render

    assert_select "form[action=?][method=?]", interviews_path, "post" do

      assert_select "input#interview_study_id[name=?]"

      assert_select "input#interview_interviewer_id[name=?]"

      assert_select "input#interview_interviewee_id[name=?]"

      assert_select "input#interview_locale_id[name=?]"
    end
  end
end

require 'rails_helper'

RSpec.describe "interviews/edit", type: :view do
  before(:each) do
    @interview = assign(:interview, Interview.create!(
      :study => nil,
      :interviewer => nil,
      :interviewee => nil,
      :locale => nil
    ))
  end

  it "renders the edit interview form" do
    render

    assert_select "form[action=?][method=?]", interview_path(@interview), "post" do

      assert_select "input#interview_study_id[name=?]", "interview[study_id]"

      assert_select "input#interview_interviewer_id[name=?]", "interview[interviewer_id]"

      assert_select "input#interview_interviewee_id[name=?]", "interview[interviewee_id]"

      assert_select "input#interview_locale_id[name=?]", "interview[locale_id]"
    end
  end
end

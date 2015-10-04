require 'rails_helper'

RSpec.describe "interviews/index", type: :view do
  let(:interview1) { FactoryGirl.create(:interview) }
  let(:interview2) { FactoryGirl.create(:interview) }
  before(:each) do
    assign(:interviews, [interview1, interview2])
  end

  it 'renders a list of interviews' do
    render
    assert_select 'tr>td', text: interview1.interview_time.to_s, count: 2
    assert_select 'tr>td', text: interview1.study.name, count: 1
    assert_select 'tr>td', text: interview2.study.name, count: 1
    assert_select 'tr>td', text: interview1.interviewer.name, count: 1
    assert_select 'tr>td', text: interview2.interviewer.name, count: 1
    assert_select 'tr>td', text: interview1.interviewee.name, count: 1
    assert_select 'tr>td', text: interview2.interviewee.name, count: 1
    assert_select 'tr>td', text: interview1.locale.name, count: 1
    assert_select 'tr>td', text: interview2.locale.name, count: 1
  end
end

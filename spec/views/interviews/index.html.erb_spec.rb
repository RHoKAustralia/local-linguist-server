require 'rails_helper'

RSpec.describe "interviews/index", type: :view do
  before(:each) do
    assign(:interviews, [
      Interview.create!(
        :study => nil,
        :interviewer => nil,
        :interviewee => nil,
        :locale => nil
      ),
      Interview.create!(
        :study => nil,
        :interviewer => nil,
        :interviewee => nil,
        :locale => nil
      )
    ])
  end

  it "renders a list of interviews" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

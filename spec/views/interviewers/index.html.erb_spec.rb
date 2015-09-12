require 'rails_helper'

RSpec.describe "interviewers/index", type: :view do
  before(:each) do
    assign(:interviewers, [
      Interviewer.create!(
        :name => "Name",
        :mobile => "Mobile",
        :device_id => "Device",
        :email => "Email"
      ),
      Interviewer.create!(
        :name => "Name",
        :mobile => "Mobile",
        :device_id => "Device",
        :email => "Email"
      )
    ])
  end

  it "renders a list of interviewers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Device".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end

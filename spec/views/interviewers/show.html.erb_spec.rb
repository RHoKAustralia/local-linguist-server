require 'rails_helper'

RSpec.describe "interviewers/show", type: :view do
  before(:each) do
    @interviewer = assign(:interviewer, Interviewer.create!(
      :name => "Name",
      :mobile => "Mobile",
      :device_id => "Device",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Device/)
    expect(rendered).to match(/Email/)
  end
end

require 'rails_helper'

RSpec.describe "interviewers/show", type: :view do
  before(:each) do
    @interviewer = assign(:interviewer, Interviewer.create!(
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end

require 'rails_helper'

RSpec.describe "interviewees/show", type: :view do
  before(:each) do
    @interviewee = assign(:interviewee, Interviewee.create!(
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

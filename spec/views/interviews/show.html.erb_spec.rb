require 'rails_helper'

RSpec.describe "interviews/show", type: :view do
  before(:each) do
    @interview = assign(:interview, Interview.create!(
      :study => nil,
      :interviewer => nil,
      :interviewee => nil,
      :locale => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

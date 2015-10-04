require 'rails_helper'

RSpec.describe "interviewees/show", type: :view do
  before(:each) do
    @interviewee = assign(:interviewee, Interviewee.create!(
      :name => "Name",
      :mobile => "Mobile",
      :email => "Email",
      :gender => "Gender",
      :occupation => "Occupation",
      :education_level => "Education Level"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(/Education Level/)
  end
end

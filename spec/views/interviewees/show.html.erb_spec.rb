require 'rails_helper'

RSpec.describe "interviewees/show", type: :view do
  before(:each) do
    @interviewee = assign(:interviewee, FactoryGirl.create(:interviewee))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(/Education level/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Locale/)
    expect(rendered).to match(/Always lived here?/)
    expect(rendered).to match(/First Language/)
  end
end

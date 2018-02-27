require 'rails_helper'

RSpec.describe "interviews/show", type: :view do
  before(:each) do
    @interview = assign(:interview, FactoryBot.create(:interview))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe "locales/show", type: :view do
  before(:each) do
    @locale = assign(:locale, FactoryBot.create(:locale))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end

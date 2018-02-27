require 'rails_helper'

RSpec.describe "phrases/show", type: :view do
  before(:each) do
    @phrase = assign(:phrase, FactoryBot.create(:phrase))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/English Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

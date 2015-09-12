require 'rails_helper'

RSpec.describe "phrases/show", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!(
      :english_text => "English Text",
      :audio => "",
      :image => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/English Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

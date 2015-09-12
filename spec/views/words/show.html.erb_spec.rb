require 'rails_helper'

RSpec.describe "words/show", type: :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :english_text => "English Text",
      :image => "",
      :study => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/English Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

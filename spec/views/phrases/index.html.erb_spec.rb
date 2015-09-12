require 'rails_helper'

RSpec.describe "phrases/index", type: :view do
  before(:each) do
    assign(:phrases, [
      Phrase.create!(
        :english_text => "English Text",
        :audio => "audio",
        :image => "image"
      ),
      Phrase.create!(
        :english_text => "English Text",
        :audio => "audio",
        :image => "image"
      )
    ])
  end

  it "renders a list of phrases" do
    render
    assert_select "tr>td", :text => "English Text".to_s, :count => 2
    assert_select "tr>td", :text => "audio".to_s, :count => 2
    assert_select "tr>td", :text => "image".to_s, :count => 2
  end
end

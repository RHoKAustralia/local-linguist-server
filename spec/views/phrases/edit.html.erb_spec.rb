require 'rails_helper'

RSpec.describe "phrases/edit", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!(
      :english_text => "MyString",
      :audio => "",
      :image => ""
    ))
  end

  it "renders the edit phrase form" do
    render

    assert_select "form[action=?][method=?]", phrase_path(@phrase), "post" do

      assert_select "input#phrase_english_text[name=?]", "phrase[english_text]"

      assert_select "input#phrase_audio[name=?]", "phrase[audio]"

      assert_select "input#phrase_image[name=?]", "phrase[image]"
    end
  end
end

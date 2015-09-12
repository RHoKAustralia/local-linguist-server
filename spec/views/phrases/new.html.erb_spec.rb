require 'rails_helper'

RSpec.describe "phrases/new", type: :view do
  before(:each) do
    assign(:phrase, Phrase.new(
      :english_text => "MyString",
      :audio => "",
      :image => ""
    ))
  end

  it "renders new phrase form" do
    render

    assert_select "form[action=?][method=?]", phrases_path, "post" do

      assert_select "input#phrase_english_text[name=?]", "phrase[english_text]"

      assert_select "input#phrase_audio[name=?]", "phrase[audio]"

      assert_select "input#phrase_image[name=?]", "phrase[image]"
    end
  end
end

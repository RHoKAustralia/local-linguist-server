require 'rails_helper'

RSpec.describe "words/new", type: :view do
  before(:each) do
    assign(:word, Word.new(
      :english_text => "MyString",
      :image => "",
      :study => nil
    ))
  end

  it "renders new word form" do
    render

    assert_select "form[action=?][method=?]", words_path, "post" do

      assert_select "input#word_english_text[name=?]", "word[english_text]"

      assert_select "input#word_image[name=?]", "word[image]"

      assert_select "input#word_study_id[name=?]", "word[study_id]"
    end
  end
end

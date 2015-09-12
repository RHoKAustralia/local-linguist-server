require 'rails_helper'

RSpec.describe "words/edit", type: :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :english_text => "MyString",
      :image => "",
      :study => nil
    ))
  end

  it "renders the edit word form" do
    render

    assert_select "form[action=?][method=?]", word_path(@word), "post" do

      assert_select "input#word_english_text[name=?]", "word[english_text]"

      assert_select "input#word_image[name=?]", "word[image]"

      assert_select "input#word_study_id[name=?]", "word[study_id]"
    end
  end
end

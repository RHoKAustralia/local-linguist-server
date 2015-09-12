require 'rails_helper'

RSpec.describe "words/index", type: :view do
  before(:each) do
    assign(:words, [
      Word.create!(
        :english_text => "English Text",
        :image => "",
        :study => nil
      ),
      Word.create!(
        :english_text => "English Text",
        :image => "",
        :study => nil
      )
    ])
  end

  it "renders a list of words" do
    render
    assert_select "tr>td", :text => "English Text".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

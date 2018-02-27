require 'rails_helper'

RSpec.describe "locales/edit", type: :view do
  before(:each) do
    @locale = assign(:locale, Locale.create!(
      :name => "MyString",
      :municipality_id => FactoryBot.create(:municipality).id
    ))
  end

  it "renders the edit locale form" do
    render

    assert_select "form[action=?][method=?]", locale_path(@locale), "post" do

      assert_select "input#locale_name[name=?]", 'locale[name]'

      assert_select "select#locale_municipality_id[name=?]", 'locale[municipality_id]'
    end
  end
end

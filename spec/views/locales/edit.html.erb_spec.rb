require 'rails_helper'

RSpec.describe "locales/edit", type: :view do
  before(:each) do
    @locale = assign(:locale, Locale.create!(
      :name => "MyString",
      :municipality => nil
    ))
  end

  it "renders the edit locale form" do
    render

    assert_select "form[action=?][method=?]", locale_path(@locale), "post" do

      assert_select "input#locale_name[name=?]"

      assert_select "input#locale_municipality_id[name=?]"
    end
  end
end

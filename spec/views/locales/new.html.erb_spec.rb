require 'rails_helper'

RSpec.describe "locales/new", type: :view do
  before(:each) do
    assign(:locale, Locale.new(
      :name => "MyString",
      :region => nil
    ))
  end

  it "renders new locale form" do
    render

    assert_select "form[action=?][method=?]", locales_path, "post" do

      assert_select "input#locale_name[name=?]", "locale[name]"

      assert_select "input#locale_region_id[name=?]", "locale[region_id]"
    end
  end
end

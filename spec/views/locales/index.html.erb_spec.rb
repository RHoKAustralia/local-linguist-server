require 'rails_helper'

RSpec.describe "locales/index", type: :view do
  before(:each) do
    assign(:locales, [
      Locale.create!(
        :name => "Name",
        :region => nil
      ),
      Locale.create!(
        :name => "Name",
        :region => nil
      )
    ])
  end

  it "renders a list of locales" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

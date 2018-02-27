require 'rails_helper'

RSpec.describe "regions/index", type: :view do
  before(:each) do
    assign(:regions, [
      FactoryBot.create(:region, name: "Name"),
      FactoryBot.create(:region, name: "Name")
    ])
  end

  it "renders a list of regions" do
    render
    assert_select "tr>td", :text => "Name", :count => 2
  end
end

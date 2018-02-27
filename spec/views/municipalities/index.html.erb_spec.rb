require 'rails_helper'

RSpec.describe "municipalities/index", type: :view do
  before(:each) do
    assign(:municipalities, [
      Municipality.create!(
        :name => "Name",
        :region_id => FactoryBot.create(:region, name: "Region").id
      ),
      Municipality.create!(
        :name => "Name",
        :region_id => FactoryBot.create(:region, name: "Region").id
      )
    ])
  end

  it "renders a list of municipalities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Region", :count => 2
  end
end

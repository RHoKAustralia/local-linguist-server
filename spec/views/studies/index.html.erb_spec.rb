require 'rails_helper'

RSpec.describe "studies/index", type: :view do
  before(:each) do
    assign(:studies, [
      Study.create!(
        :name => "Name",
        :region => nil
      ),
      Study.create!(
        :name => "Name",
        :region => nil
      )
    ])
  end

  it "renders a list of studies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "studies/index", type: :view do
  before(:each) do
    assign(:studies, [
      Study.create!(
        :name => "Study Name",
        :language => nil
      ),
      Study.create!(
        :name => "Study Name",
        :language => nil
      )
    ])
  end

  it "renders a list of studies" do
    render
    assert_select "tr>td", :text => "Study Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end

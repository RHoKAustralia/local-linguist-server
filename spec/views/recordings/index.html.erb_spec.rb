require 'rails_helper'

RSpec.describe "recordings/index", type: :view do
  before(:each) do
    assign(:recordings, [
      Recording.create!(
        :audio => "",
        :interview => nil,
        :language => nil,
        :word => nil
      ),
      Recording.create!(
        :audio => "",
        :interview => nil,
        :language => nil,
        :word => nil
      )
    ])
  end

  it "renders a list of recordings" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

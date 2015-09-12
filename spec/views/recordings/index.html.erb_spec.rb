require 'rails_helper'

RSpec.describe "recordings/index", type: :view do
  before(:each) do
    assign(:recordings, [
      Recording.create!(
        :audio => "recording",
        :interview => nil,
        :language => nil,
        :phrase => nil
      ),
      Recording.create!(
        :audio => "recording",
        :interview => nil,
        :language => nil,
        :phrase => nil
      )
    ])
  end

  it "renders a list of recordings" do
    render
    assert_select "tr>td", :text => "recording".to_s, :count => 2
  end
end

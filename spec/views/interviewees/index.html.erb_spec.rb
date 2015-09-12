require 'rails_helper'

RSpec.describe "interviewees/index", type: :view do
  before(:each) do
    assign(:interviewees, [
      Interviewee.create!(
        :name => "Name",
        :email => "Email"
      ),
      Interviewee.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of interviewees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end

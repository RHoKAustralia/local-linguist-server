require 'rails_helper'

RSpec.describe "interviewees/index", type: :view do
  before(:each) do
    assign(:interviewees, [
      Interviewee.create!(
        :name => "Name",
        :mobile => "Mobile",
        :email => "Email",
        :gender => "Gender",
        :occupation => "Occupation",
        :education_level => "Education Level"
      ),
      Interviewee.create!(
        :name => "Name",
        :mobile => "Mobile",
        :email => "Email",
        :gender => "Gender",
        :occupation => "Occupation",
        :education_level => "Education Level"
      )
    ])
  end

  it "renders a list of interviewees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Occupation".to_s, :count => 2
    assert_select "tr>td", :text => "Education Level".to_s, :count => 2
  end
end

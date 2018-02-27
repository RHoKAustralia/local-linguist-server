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
        :education_level => "Education Level",
        :age => 21,
        locale_id: FactoryBot.create(:locale).id,
        first_language: "Tetung"
      ),
      Interviewee.create!(
        :name => "Name",
        :mobile => "Mobile",
        :email => "Email",
        :gender => "Gender",
        :occupation => "Occupation",
        :education_level => "Education Level",
        :age => 21,
        locale_id: FactoryBot.create(:locale).id,
        first_language: "Tetung"
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

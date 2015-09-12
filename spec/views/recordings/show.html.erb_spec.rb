require 'rails_helper'

RSpec.describe "recordings/show", type: :view do
  before(:each) do
    @recording = assign(:recording, Recording.create!(
      :audio => "",
      :interview => nil,
      :language => nil,
      :phrase => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

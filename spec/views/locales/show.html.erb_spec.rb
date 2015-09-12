require 'rails_helper'

RSpec.describe "locales/show", type: :view do
  before(:each) do
    @locale = assign(:locale, Locale.create!(
      :name => "Name",
      :region => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end

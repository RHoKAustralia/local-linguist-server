require 'rails_helper'

RSpec.describe "studies/show", type: :view do
  before(:each) do
    @study = assign(:study, Study.create!(
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

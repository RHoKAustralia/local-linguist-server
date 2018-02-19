require 'rails_helper'

RSpec.describe 'studies/show', type: :view do
  before(:each) do
    @study = assign(:study, FactoryGirl.create(:study))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Start date/)
  end
end

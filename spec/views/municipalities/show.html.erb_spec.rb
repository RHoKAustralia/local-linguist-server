require 'rails_helper'

RSpec.describe 'municipalities/show', type: :view do
  let(:municipality) { FactoryBot.create(:municipality) }
  before(:each) do
    @municipality = assign(:municipality, municipality)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe 'locales/index', type: :view do
  let(:municipality) { FactoryGirl.create(:municipality) }
  before(:each) do
    assign(:locales, [
      Locale.create!(
        name: 'Name',
        municipality: municipality
      ),
      Locale.create!(
        name: 'Name',
        municipality: municipality
      )
    ])
  end

  it 'renders a list of locales' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: municipality.name, count: 2
  end
end

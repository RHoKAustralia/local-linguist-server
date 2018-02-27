require 'rails_helper'

RSpec.describe "studies/index", type: :view do
  let(:study1) { FactoryBot.create(:study) }
  let(:study2) { FactoryBot.create(:study) }

  before(:each) do
    assign(:studies, [study1, study2])
  end

  it 'renders a list of studies' do
    render
    assert_select 'tr>td', text: study1.name.to_s, count: 1
    assert_select 'tr>td', text: study2.name.to_s, count: 1
    assert_select 'tr>td', text: study1.start_date.to_s, count: 2
  end
end

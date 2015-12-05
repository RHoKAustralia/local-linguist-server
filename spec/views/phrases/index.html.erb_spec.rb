require 'rails_helper'

RSpec.describe 'phrases/index', type: :view do
  let(:phrase1) { FactoryGirl.create(:phrase) }
  let(:phrase2) { FactoryGirl.create(:phrase) }

  before(:each) do
    assign(:phrases, [phrase1, phrase2])
  end

  it 'renders a list of phrases' do
    render
    assert_select 'tr>td', text: phrase1.english_text.to_s, count: 1
    assert_select 'tr>td', text: phrase2.english_text.to_s, count: 1
    assert_select 'tr>td', text: phrase1.audio.to_s, count: 2
    assert_select 'tr>td', text: phrase2.image.to_s, count: 2
  end
end

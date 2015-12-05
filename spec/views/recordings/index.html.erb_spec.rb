require 'rails_helper'

RSpec.describe "recordings/index", type: :view do
  let(:recording1) { FactoryGirl.create(:recording) }
  let(:recording2) { FactoryGirl.create(:recording) }

  before(:each) do
    assign(:recordings, [recording1, recording2])
  end

  it 'renders a list of recordings' do
    render
    assert_select 'tr>td', text: recording1.audio_url.to_s, count: 2
    assert_select 'tr>td', text: recording2.audio_url.to_s, count: 2
    assert_select 'tr>td', text: recording1.recorded.to_s, count: 2
    assert_select 'tr>td', text: recording1.interview.to_s, count: 1
    assert_select 'tr>td', text: recording2.interview.to_s, count: 1
    assert_select 'tr>td', text: recording1.language.to_s, count: 1
    assert_select 'tr>td', text: recording2.language.to_s, count: 1
    assert_select 'tr>td', text: recording1.phrase.to_s, count: 1
    assert_select 'tr>td', text: recording2.phrase.to_s, count: 1
  end
end

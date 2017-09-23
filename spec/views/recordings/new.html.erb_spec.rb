require 'rails_helper'

RSpec.describe 'recordings/new', type: :view do
  before(:each) do
    assign(:recording, Recording.new(
      :audio => '',
      :interview => nil,
      :phrase => nil
    ))
  end

  it 'renders new recording form' do
    render

    assert_select 'form[action=?][method=?]', recordings_path, 'post' do

      assert_select 'input#recording_audio[name=?]', 'recording[audio]'

      assert_select 'select#recording_recorded_1i[name=?]', 'recording[recorded(1i)]'
      assert_select 'select#recording_recorded_2i[name=?]', 'recording[recorded(2i)]'
      assert_select 'select#recording_recorded_3i[name=?]', 'recording[recorded(3i)]'
      assert_select 'select#recording_recorded_4i[name=?]', 'recording[recorded(4i)]'
      assert_select 'select#recording_recorded_5i[name=?]', 'recording[recorded(5i)]'

      assert_select 'select#recording_interview_id[name=?]', 'recording[interview_id]'

      assert_select 'select#recording_phrase_id[name=?]', 'recording[phrase_id]'
    end
  end
end

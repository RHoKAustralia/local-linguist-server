require 'rails_helper'

RSpec.describe "recordings/new", type: :view do
  before(:each) do
    assign(:recording, Recording.new(
      :audio => "",
      :interview => nil,
      :language => nil,
      :word => nil
    ))
  end

  it "renders new recording form" do
    render

    assert_select "form[action=?][method=?]", recordings_path, "post" do

      assert_select "input#recording_audio[name=?]", "recording[audio]"

      assert_select "input#recording_interview_id[name=?]", "recording[interview_id]"

      assert_select "input#recording_language_id[name=?]", "recording[language_id]"

      assert_select "input#recording_word_id[name=?]", "recording[word_id]"
    end
  end
end

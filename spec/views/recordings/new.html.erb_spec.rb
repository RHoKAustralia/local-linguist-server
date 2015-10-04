require 'rails_helper'

RSpec.describe "recordings/new", type: :view do
  before(:each) do
    assign(:recording, Recording.new(
      :audio => "",
      :interview => nil,
      :language => nil,
      :phrase => nil
    ))
  end

  it "renders new recording form" do
    render

    assert_select "form[action=?][method=?]", recordings_path, "post" do

      assert_select "input#recording_audio[name=?]"

      assert_select "input#recording_interview_id[name=?]"

      assert_select "input#recording_language_id[name=?]"

      assert_select "input#recording_phrase_id[name=?]"
    end
  end
end

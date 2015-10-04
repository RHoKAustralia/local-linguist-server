require 'rails_helper'

RSpec.describe "recordings/edit", type: :view do
  before(:each) do
    @recording = assign(:recording, Recording.create!(
      :audio => "",
      :interview => nil,
      :language => nil,
      :phrase => nil
    ))
  end

  it "renders the edit recording form" do
    render

    assert_select "form[action=?][method=?]", recording_path(@recording), "post" do

      assert_select "input#recording_audio[name=?]", "recording[audio]"

      assert_select "input#recording_interview[name=?]", "recording[interview]"

      assert_select "input#recording_language[name=?]", "recording[language]"

      assert_select "input#recording_phrase[name=?]", "recording[phrase]"
    end
  end
end

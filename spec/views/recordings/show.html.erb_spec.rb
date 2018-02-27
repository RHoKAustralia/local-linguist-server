require 'rails_helper'

RSpec.describe "recordings/show", type: :view do
  before(:each) do
    @recording = assign(:recording, FactoryBot.create(:recording))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Recorded/)
    expect(rendered).to match(/Interview/)
    expect(rendered).to match(/Phrase/)
  end
end

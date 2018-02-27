require 'rails_helper'

RSpec.describe Interviewer, type: :model do
  subject { FactoryBot.create(:interviewer) }

  describe '#to_s' do
    it 'shows the interviewers name' do
      expect(subject.to_s).to eq(subject.name)
    end
  end
end

require 'rails_helper'

RSpec.describe Phrase, type: :model do
  describe '#to_s' do
    subject { FactoryBot.create(:phrase) }
    it 'returns the english text' do
      expect(subject.to_s).to eq(subject.english_text)
    end
  end
end

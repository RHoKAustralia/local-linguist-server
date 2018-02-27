require 'rails_helper'

RSpec.describe Region, type: :model do
  subject { FactoryBot.create(:region) }

  describe '#to_s' do
    it 'returns the name' do
      expect(subject.to_s).to eq(subject.name)
    end
  end
end

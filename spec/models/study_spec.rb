require 'rails_helper'

RSpec.describe Study, type: :model do
  subject { FactoryBot.create(:study) }

  describe '#to_s' do
    it 'returns the name' do
      expect(subject.to_s).to eq(subject.name)
    end
  end
end

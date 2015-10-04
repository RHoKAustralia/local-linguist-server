require 'rails_helper'

RSpec.describe Interviewee, type: :model do
  subject { FactoryGirl.create(:interviewee) }

  describe '#to_s' do
    it 'returns the name' do
      expect(subject.to_s).to eq(subject.name)
    end
  end
end

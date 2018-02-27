require 'rails_helper'

RSpec.describe Interview, type: :model do
  subject { FactoryBot.create(:interview) }

  describe '#to_s' do
    it 'returns the study name, location name and interview time' do
      expect(subject.to_s).to eq("#{subject.study_name}, #{subject.locale_name}, #{subject.interview_time}")
    end
  end
end

FactoryBot.define do
  factory :interview do |i|
    i.interview_time '2015-09-28 17:29:15'
    i.study { |a| a.association(:study) }
    i.interviewer { |a| a.association(:interviewer) }
    i.interviewee { |a| a.association(:interviewee) }
    i.locale { |a| a.association(:locale) }
    i.language { |a| a.association(:language) }
    i.zipfile_file_name 'blah.zip'
    i.zipfile_content_type 'application/zip'
    i.zipfile_file_size 1024
    i.zipfile_updated_at DateTime.now
  end
end

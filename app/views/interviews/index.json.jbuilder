json.array!(@interviews) do |interview|
  json.extract! interview, :id, :interview_time, :study_id, :interviewer_id, :interviewee_id, :locale_id
  json.url interview_url(interview, format: :json)
end

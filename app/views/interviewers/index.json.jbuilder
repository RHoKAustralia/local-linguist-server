json.array!(@interviewers) do |interviewer|
  json.extract! interviewer, :id, :name, :email
  json.url interviewer_url(interviewer, format: :json)
end

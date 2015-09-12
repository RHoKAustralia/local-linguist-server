json.array!(@interviewers) do |interviewer|
  json.extract! interviewer, :id, :name, :mobile, :device_id, :email
  json.url interviewer_url(interviewer, format: :json)
end

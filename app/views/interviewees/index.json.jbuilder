json.array!(@interviewees) do |interviewee|
  json.extract! interviewee, :id, :name, :email
  json.url interviewee_url(interviewee, format: :json)
end

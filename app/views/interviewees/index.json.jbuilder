json.array!(@interviewees) do |interviewee|
  json.extract! interviewee, :id, :name, :mobile, :email, :gender, :occupation, :education_level
  json.url interviewee_url(interviewee, format: :json)
end

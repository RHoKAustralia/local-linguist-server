json.array!(@interviewees) do |interviewee|
  json.extract! interviewee, :id, :name, :mobile, :email, :gender, :occupation, :education_level, :age, :locale, :lived_whole_life, :first_language
  json.url interviewee_url(interviewee, format: :json)
end

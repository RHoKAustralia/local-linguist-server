# encoding: utf-8
module Linguist
  # API for Local Linguist
  class API < Grape::API
    version 'v1', using: :path
    format :json

    params do
      requires :file, type: File
    end
    post :upload_interview do
      Rails.logger.info("Interview uploaded with params #{params}")
      upload = UploadedInterview.new(params)
      upload.extract_zip
      interview = upload.interview
      {
        data: {
          interview: {
            interview_time: interview.interview_time,
            interviewer: interview.interviewer,
            interviewee: interview.interviewee,
            locale: interview.locale,
            language: interview.language,
            phrases: interview.phrases.order(:id),
            recordings: interview.recordings.order(:id)
          }
        }
      }
    end

    get :health do
      { message: 'Hi' }
    end
  end
end

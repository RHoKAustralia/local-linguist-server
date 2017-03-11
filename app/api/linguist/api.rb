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
      interview = UploadedInterview.new(params)
      interview.extract_zip
      interview
    end

    get :hi do
      { message: 'Hi' }
    end
  end
end

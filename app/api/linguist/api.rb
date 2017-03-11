module Linguist
  # API for Local Linguist
  class API < Grape::API
    version 'v1', using: :path

    params do
      requires :file, type: File
    end
    post :upload_interview do
      Rails.logger.debug("Interview uploaded with params #{params}")
      interview = UploadedInterview.new(params)
      interview.extract_zip
    end
  end
end

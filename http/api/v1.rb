# frozen_string_literal: true

class API
  class V1 < Grape::API
    version :v1

    desc 'Health check'
    get :health do
      { status: :healthy }
    end

    add_swagger_documentation add_version: 'v1', doc_version: Grail.app.version
  end
end

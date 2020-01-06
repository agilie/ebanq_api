# frozen_string_literal: true

module EbanqApi
  ##
  # Forms endpoints
  module ApiPaths
    AUTH_API_PATH = 'api/v1/auth'
    PROFILE_API_PATH = 'api/v1/profile'
    ACCOUNT_API_PATH = '/api/v1/accounts'
    NEWS_API_PATH = '/api/v1/news'

    # Return /api/v1/auth path
    def auth_path(action)
      "#{AUTH_API_PATH}/#{action}"
    end

    # Return /api/v1/accounts path
    def account_path(action = '')
      "#{ACCOUNT_API_PATH}/#{action}"
    end

    # Return /api/v1/news path
    def news_path(action = '')
      "#{NEWS_API_PATH}/#{action}"
    end
  end
end

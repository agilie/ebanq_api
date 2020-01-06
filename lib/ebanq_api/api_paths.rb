# frozen_string_literal: true

module EbanqApi
  ##
  # Forms endpoints
  module ApiPaths
    AUTH_API_PATH = 'api/v1/auth'
    PROFILE_API_PATH = 'api/v1/profile'

    # Return /api/v1/auth path
    def auth_path(action)
      "#{AUTH_API_PATH}/#{action}"
    end
  end
end

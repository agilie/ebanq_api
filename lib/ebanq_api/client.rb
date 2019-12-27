# frozen_string_literal: true

require 'rest_client'
require 'json'
require 'ebanq_api/exceptions'

module EbanqApi
  class Client

    ERROR_CODES = {
      400 => BadRequest,
      403 => Forbidden,
      404 => NotFound,
      406 => NotAcceptable,
      429 => TooManyRequests,
      500 => InternalServerError,
      502 => BadGateway,
      503 => ServiceUnavailable,
      504 => GatewayTimeout
    }.freeze

    def initialize
      auth_login_response = auth.login_with_token(EbanqApi.token, EbanqApi.secret)
      @auth_token = auth_login_response['response']['token']
    end

    def make_request(method, url, values = {})
      response = if method == :get
                   RestClient.get("#{EbanqApi.base_url}/#{url}", headers)
                 else
                   RestClient.post("#{EbanqApi.base_url}/#{url}", values, headers)
                 end
      result = JSON.parse(response.body)
      success?(result['code']) ? result : parse_failed(result)
    rescue RestClient::ResourceNotFound, SocketError, Errno::ECONNREFUSED => error
      raise error
    end

    def auth
      @auth ||= EbanqApi::Auth.new(self)
    end

    private

    def headers
      {
        content_type: 'application/x-www-form-urlencoded',
        accept: 'application/json',
        services_token: @auth_token
      }
    end

    def success?(code)
      code.to_i >= 200 && code.to_i < 300
    end

    def parse_failed(response)
      error = ERROR_CODES[response['code']].new(response)
      raise error, error.message
    end
  end
end

# frozen_string_literal: true

require 'rest_client'
require 'json'
require 'ebanq_api/exceptions'
require 'ebanq_api/response_wrapper'

# Client functionality
module EbanqApi
  ##
  # This class represents client functionality.
  class Client
    include ResponseWrapper

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

    # Requests service_token for current user.
    def initialize
      auth_login_response = auth.login_with_token(EbanqApi.token,
                                                  EbanqApi.secret)
      @auth_token = auth_login_response['token']
    end

    # Makes a request to Ebanq REST Api.
    #
    # ==== Attributes
    #
    # * +method+ - :get or :post value
    # * +url+ - name of endpoint
    # * +values+ - values from request
    # Returns full body of response if no errors are found,
    # raise error otherwise.
    def make_request(method, url, params = {})
      path = "#{EbanqApi.base_url}/#{url}"
      response = case method
                 when :get then get(path, headers, params)
                 when :post then post(path, headers, params)
                 when :put then put(path, headers, params)
                 when :delete then delete(path, headers)
                 else raise 'Error'
                 end
      process_raw_response(response)
    rescue RestClient::ResourceNotFound, SocketError, Errno::ECONNREFUSED => e
      raise e
    end

    # Declares an registration instance.
    def registration
      @registration ||= EbanqApi::Registration.new(self)
    end

    # Declares an auth instance.
    def auth
      @auth ||= EbanqApi::Auth.new(self)
    end

    # Declares an profile instance.
    def profile
      @profile ||= EbanqApi::Profile.new(self)
    end

    # Declares an accounts instance.
    def accounts
      @accounts ||= EbanqApi::Accounts.new(self)
    end

    # Declares an news instance.
    def news
      @news ||= EbanqApi::News.new(self)
    end

    # Declares an messages instance.
    def messages
      @messages ||= EbanqApi::Messages.new(self)
    end

    # Declares an cards instance.
    def cards
      @cards ||= EbanqApi::Cards.new(self)
    end

    # Declares an requests instance.
    def requests
      @requests ||= EbanqApi::Requests.new(self)
    end

    # Declares an reports instance.
    def reports
      @reports ||= EbanqApi::Reports.new(self)
    end

    # Declares an settings instance.
    def settings
      @settings ||= EbanqApi::Settings.new(self)
    end

    # Declares an templates instance.
    def templates
      @templates ||= EbanqApi::Templates.new(self)
    end

    def transactions
      @transactions ||= EbanqApi::Transactions.new(self)
    end

    private

    def success?(code)
      code.to_i >= 200 && code.to_i < 300
    end

    def get(path, headers, params = {})
      RestClient::Request.execute(method: :get, url: path,
                                  timeout: 10,
                                  headers: headers
                                             .merge!(params: params))
    end

    def post(path, headers, params = {})
      RestClient.post(path, params, headers)
    end

    def put(path, headers, params = {})
      RestClient.put path, params, headers
    end

    def delete(path, headers)
      RestClient.delete path, headers
    end

    def process_raw_response(raw_response)
      !raw_response.body.empty? ? process_response_body(raw_response) : {}
    end

    def process_response_body(raw_response)
      result = JSON.parse(raw_response.body)
      success?(result['code']) ? wrap(result['response']) : parse_failed(result)
    end

    def parse_failed(response)
      error = ERROR_CODES[response['code']].new(response)
      raise error, error.message
    end

    def headers
      headers = {
        content_type: 'application/x-www-form-urlencoded',
        accept: 'application/json'
      }
      headers.merge!(services_token: @auth_token) if @auth_token
      headers
    end
  end
end

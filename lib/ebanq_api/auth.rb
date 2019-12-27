# frozen_string_literal: true

require 'ebanq_api/client'

module EbanqApi
  ##
  # This class represents an auth block of Ebanq REST Api.
  class Auth
    AUTH_API_PATH = 'api/v1/auth'

    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # Login a user for a new session
    # /api/v1/auth/login
    #
    # ==== Attributes
    #
    # * +username+ (required) - A valid username
    # * +password+ (required) -  A valid password
    # * +device_id+ (required) - Device ID
    # * +push_token+ - Push token
    def login(username, password, device_id, push_token = '')
      values = {
        username: username,
        password: password,
        device_id: device_id,
        push_token: push_token
      }

      @client.make_request :post, auth_path('login'), values
    end

    # Get user profile data.
    # /api/v1/auth/{uid}
    #
    # ==== Attributes
    #
    # * +uid+ (required) - The id of the user
    def profile_data(uid)
      @client.make_request :get, auth_path(uid)
    end

    # Update user profile data
    # /api/v1/auth/{uid}
    #
    # ==== Attributes
    #
    # * +uid+ (required) - The id of the user
    # * +fields+ (required) - hash of params which needs to update,
    # e.g. {first_name: 'John', last_name: 'Doe'}
    def update_profile(uid, fields)
      @client.make_request :post,
                           auth_path(uid), fields
    end

    # Login a user for a new session using token and secret.
    # Endpoint for third party clients.
    # /api/v1/auth/login_token
    #
    # ==== Attributes
    #
    # * +token+ (required) - A user token
    # * +secret+ (required) - A user secret
    def login_with_token(token, secret)
      values = {
        token: token,
        secret: secret
      }
      @client.make_request :post,
                           auth_path('login_token'),
                           values
    end

    # Logout a user session
    # /api/v1/auth/logout
    def logout
      @client.make_request :post,
                           auth_path('logout')
    end

    # Logout a user session by device id only
    # /api/v1/auth/logout_device
    #
    # ==== Attributes
    #
    # * +device_id+ (required) - Device ID
    def logout_device(device_id)
      values = {
        device_id: device_id
      }
      @client.make_request :post,
                           auth_path('logout_device'),
                           values
    end

    # Request a new password, given a user name or e-mail address
    # /api/v1/auth/request_new_password
    #
    # ==== Attributes
    #
    # * +name+ (required) - A valid user name or e-mail address
    def request_new_password(name)
      values = {
        name: name
      }
      @client.make_request :post,
                           auth_path('request_new_password'),
                           values
    end

    # Login by PIN and Device ID
    # /api/v1/auth/login_pin
    #
    # ==== Attributes
    #
    # * +pin+ (required) - PIN code
    # * +device_id+ (required) - Device ID
    # * +push_token+ (required) - Push Token
    def login_by(pin, device_id, push_token)
      values = {
        pin: pin,
        device_id: device_id,
        push_token: push_token
      }
      @client.make_request :post,
                           auth_path('login_pin'),
                           values
    end

    # Set user pin
    # /api/v1/auth/pin
    #
    # ==== Attributes
    #
    # * +pin+ (required) - PIN code
    def update_user_pin(pin)
      values = {
        pin: pin
      }
      @client.make_request :post,
                           auth_path('pin'),
                           values
    end

    # Get token (Refresh token)
    # /api/v1/auth/token
    #
    # ==== Attributes
    #
    # * +pin+ (required) - PIN code
    # * +device_id+ (required) - Device ID
    def refresh_token(pin, device_id)
      values = {
        pin: pin,
        device_id: device_id
      }
      @client.make_request :post,
                           auth_path('token'),
                           values
    end

    # Process one time login link and return the pass_reset
    # /api/v1/auth/user_pass_reset
    #
    # ==== Attributes
    #
    # * +uid+ (required) - The uid of the user in the operation.
    # * +timestamp+ (required) - The timestamp value from the
    # reset password link.
    # * +hashed_pass+ (required) - The hashed pass value from
    # the reset password link.
    def pass_reset_token(uid, timestamp, hashed_pass)
      values = {
        uid: uid,
        timestamp: timestamp,
        hashed_pass: hashed_pass
      }
      @client.make_request :post,
                           auth_path('user_pass_reset'),
                           values
    end

    # Set push token
    # api/v1/auth/push_token
    #
    # ==== Attributes
    #
    # * +token+ (required) - Push token
    # * +os_type+ (required) - OS type
    def update_push_token(token, os_type)
      values = {
        token: token,
        os: os_type
      }

      @client.make_request :post,
                           auth_path('push_token'),
                           values
    end

    # Password reset
    # /api/v1/auth/uid/password_reset
    #
    # ==== Attributes
    #
    # * +uid+ (required) - The id of the user
    def reset_password(uid)
      values = {
        uid: uid
      }
      @client.make_request :post,
                           auth_path("#{uid}/password_reset"),
                           values
    end

    private

    # Return /api/v1/auth path
    def auth_path(action)
      "#{AUTH_API_PATH}/#{action}"
    end
  end
end

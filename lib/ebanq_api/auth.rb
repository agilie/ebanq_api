# frozen_string_literal: true

require 'ebanq_api/client'

module EbanqApi

  ##
  # This class represents an auth block of Ebanq REST Api.
  class Auth

    AUTH_API_PATH = 'api/v1/auth'

    def initialize(client)
      @client = client
    end

    def login(username, password, device_id = '', push_token = '')
      values = {
        username: username,
        password: password,
        device_id: device_id,
        push_token: push_token
      }

      @client.make_request :post, auth_path('login'), values
    end

    def profile_data(uid)
      @client.make_request :get, auth_path(uid)
    end

    def update_profile(uid, fields)
      @client.make_request :post,
                           auth_path(uid), fields
    end

    def login_with_token(token, secret)
      values = {
        token: token,
        secret: secret
      }
      @client.make_request :post,
                           auth_path('login_token'),
                           values
    end

    def logout_device(device_id)
      values = {device_id: device_id}
      @client.make_request :post,
                           auth_path('logout_device'),
                           values
    end

    def request_new_password(name)
      values = {
        name: name
      }
      @client.make_request :post,
                           auth_path('request_new_password'),
                           values
    end

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

    def update_user_pin(pin)
      values = {
        pin: pin
      }
      @client.make_request :post,
                           auth_path('pin'),
                           values
    end

    def refresh_token(pin, device_id)
      values = {
        pin: pin,
        device_id: device_id
      }
      @client.make_request :post,
                           auth_path('token'),
                           values
    end

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

    def update_push_token(token, os_type)
      values = {token: token, os: os_type}

      @client.make_request :post,
                           auth_path('push_token'),
                           values
    end

    def reset_password(uid)
      values = {
        uid: uid
      }
      @client.make_request :post,
                           auth_path('password_reset'),
                           values
    end

    private

    def auth_path(action)
      "#{AUTH_API_PATH}/#{action}"
    end
  end
end

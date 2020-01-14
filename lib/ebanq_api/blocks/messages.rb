# frozen_string_literal: true

require 'ebanq_api/client'
require 'ebanq_api/api_paths'

# Messages block
module EbanqApi
  ##
  # This class represents an messages functional of Ebanq REST Api.
  class Messages
    include ApiPaths
    # Declares an client instance.
    def initialize(client)
      @client = client
    end

    # List of all incoming messages
    # /api/v1/messages
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request,
    # e.g. {page: 1, per_page: 2, order: 'last_update'}
    # * * +page+ - Number of page with messages. (Number)
    # * * +per_page+ - Count messages per page. (Number)
    # * * +order+ - Sorting for messages list.
    # Allowed values: last_update, subject. (String)
    # * * +sort+ - Order of sorting for messages list.
    # Allowed values: asc, desc.
    # * * +search+ - Part of subject of text of messages for search. (String)
    def list(options = {})
      @client.make_request :get, messages_path, options
    end

    # Retrieve a message
    # /api/v1/messages/{id}
    #
    # ==== Attributes
    # * +id+ (required) - Message id (Number)
    #
    # @return Array
    def show(id)
      @client.make_request :get, messages_path(id)
    end

    # Retrieve all outgoing messages
    # /api/v1/messages/outgoing
    #
    # ==== Attributes
    #
    # * +options+ - hash of options for request,
    # e.g. {page: 1, per_page: 2, order: 'last_update'}
    # * * +page+ - Number of page with messages. (Number)
    # * * +per_page+ - Count messages per page. (Number)
    # * * +order+ - Sorting for messages list.
    # Allowed values: last_update, subject. (String)
    # * * +sort+ - Order of sorting for messages list.
    # Allowed values: asc, desc.
    # * * +search+ - Part of subject of text of messages for search. (String)
    def outgoing(options = {})
      @client.make_request :get, messages_path('outgoing'), options
    end

    # Get unread messages count
    # /api/v1/messages/unread-count
    def unread_count
      @client.make_request :get, messages_path('unread-count')
    end

    # Send message to administrator
    # /api/v1/messages/send
    #
    # ==== Attributes
    # * +subject+ (required) - (String)
    # * +body+ (required) - (String)
    # * +recipient+  - (String)
    # * +thread_id+  - (Number)
    def send_to_administrator(subject, body, recipient = '', thread_id = '')
      values = {
        recipient: recipient,
        subject: subject,
        body: body,
        thread_id: thread_id
      }

      @client.make_request :post, messages_path('send'), values
    end

    # Send message to all users
    # api/v1/messages/send/all
    #
    # ==== Attributes
    # * +subject+ (required) - (String)
    # * +body+ (required) - (String)
    # * +thread_id+  - (Number)
    def send_to_all(subject, body, thread_id = '')
      values = {
        subject: subject,
        body: body,
        thread_id: thread_id
      }

      @client.make_request :post, messages_path('send/all'), values
    end

    # Send message to a group
    # /api/v1/messages/send/groups/
    #
    # ==== Attributes
    # * +subject+ (required) - (String)
    # * +body+ (required) - (String)
    # * +recipient+  - (String)
    # * +thread_id+  - (Number)
    def send_to_a_group(subject, body, recipient = '', thread_id = '')
      values = {
        recipient: recipient,
        subject: subject,
        body: body,
        thread_id: thread_id
      }

      @client.make_request :post, messages_path('send/groups'), values
    end

    # Delete messages thread
    # /api/v1/messages/{id}
    #
    # ==== Attributes
    # * +id+ (required) - Thread ID. (Number)
    def delete_thread(id)
      @client.make_request :delete, messages_path(id)
    end
  end
end

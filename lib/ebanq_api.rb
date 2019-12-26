# frozen_string_literal: true

require 'ebanq_api/version'
require 'ebanq_api/client'

module EbanqApi
  class ServerError < StandardError; end
  class NotFoundError < StandardError; end
  class BadRequestError < StandardError; end
  class UnauthorizedError < StandardError; end

end

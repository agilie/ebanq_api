# frozen_string_literal: true

module EbanqApi

  class BadRequest < StandardError
  end

  class Forbidden < StandardError
  end

  class NotFound < StandardError
  end

  class NotAcceptable < StandardError
  end

  class TooManyRequests < StandardError
  end

  class InternalServerError < StandardError
  end

  class BadGateway < StandardError
  end

  class ServiceUnavailable < StandardError
  end

  class GatewayTimeout < StandardError
  end

  class InvalidSignature < StandardError
  end

  class RateLimitExceeded < StandardError
  end

end

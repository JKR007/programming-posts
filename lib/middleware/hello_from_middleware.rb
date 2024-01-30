module Middleware
  class HelloFromModdleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      Rails.logger.info '============ Hello from middleware ========='

      [status, headers, response]
    end
  end
end

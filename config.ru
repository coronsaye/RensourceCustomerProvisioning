# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application


use Rack::Lint # gives more descriptive error messages when responses aren't valid

class Logger
  def initialize(app)
    @app = app
  end
  def call(env)

    status, headers, body = @app.call(env)
    body.map { |msg| p "Example: #{msg}" }
    [status, headers, body]
  end
end
use Logger # Does nothing with uppercase'd response, just logs it to stdout

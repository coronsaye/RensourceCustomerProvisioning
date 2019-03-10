# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application


use Rack::Lint # gives more descriptive error messages when responses aren't valid'
#


class Logger
  def initialize(app)
    @app = app
  end
  def call(env)
    env[:timestamp] = Time.now
    p "---------------------------------------------------------------------------------------------------------"
    p "REQUEST_PATH: #{env['REQUEST_PATH']}, HOST:#{env['HTTP_HOST']}, REMOTE_ADDR:#{env['REMOTE_ADDR']}, REQUEST_TIME:#{env[:timestamp]}"
    status, headers, body , any = @app.call(env)
    if status == 200
      body.map { |msg| p "RESPONSE: #{msg},RESPONSE_TIME: #{ Time.now}" }
    else

      p "RESPONSE: INVALID REQUEST,RESPONSE_TIME: #{ Time.now}"
    end

    p "---------------------------------------------------------------------------------------------------------"

    [status, headers, body]
  end
end
use Logger # Does nothing with uppercase'd response, just logs it to stdout


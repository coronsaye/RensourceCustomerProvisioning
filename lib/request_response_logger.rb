require pp

class RequestResponseLogger

  def initialize(app)
    @app = app
  end
  def call(env)
    pp env
    status, headers, body = @app.call(env)
    #body.map { |msg| p "Example: #{msg}" }
    [status, headers, body]
  end

end
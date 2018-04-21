# frozen_string_literal: true

require_relative 'config/app'

require 'rack/cors'
require 'active_support/executor'
require 'rack/body_proxy'

module ActionDispatch
  class Executor
    def initialize(app, executor)
      @app, @executor = app, executor
    end

    def call(env)
      state = @executor.run!
      begin
        response = @app.call(env)
        returned = response << ::Rack::BodyProxy.new(response.pop) { state.complete! }
      ensure
        state.complete! unless returned
      end
    end
  end
end

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end
end

use ActionDispatch::Executor, ActiveSupport::Executor
ActiveRecord::QueryCache.install_executor_hooks

run API

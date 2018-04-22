# frozen_string_literal: true

require_relative 'config/initialize'

require 'rack/cors'
require 'active_support/executor'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end
end

use ActionDispatch::Executor, ActiveSupport::Executor
ActiveRecord::QueryCache.install_executor_hooks

run API

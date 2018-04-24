# frozen_string_literal: true

require_relative 'app'
require 'rack/body_proxy'

unless defined? Rails
  # Unless Rails exists mock namespace and necessary methods
  #   This makes ActiveRecord rake tasks functional
  module Rails
    extend SingleForwardable
    # :nodoc:
    class Paths
      def paths
        {
          'db/migrate' => [
            Grail.app.db_migrate_dir
          ]
        }
      end

      def load_seed
        load Grail.app.db_dir.join('seeds.rb')
      end
    end

    delegate %i[root env] => 'Grail.app'

    def self.application
      Paths.new
    end
  end
end

unless defined? ActionDispatch::Executor
  # Unless Rails or ActionPack loaded ActionDispatch::Executor doesn't exist
  # This is required to have proper connection pool management in Rack
  # @example
  #   use ActionDispatch::Executor, ActiveSupport::Executor
  module ActionDispatch
    # :nodoc:
    class Executor
      def initialize(app, executor)
        @app      = app
        @executor = executor
      end

      def call(env)
        state = @executor.run!
        begin
          response = @app.call(env)
          returned = response << ::Rack::BodyProxy.new(response.pop) do
            state.complete!
          end
        ensure
          state.complete! unless returned
        end
      end
    end
  end
end

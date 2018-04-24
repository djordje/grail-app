# frozen_string_literal: true

require 'yaml'
require 'dotenv'
require 'active_record'
require 'active_support/dependencies'

# Grail is a namespace of a logic related to bootstrap Grape and ActiveRecord
module Grail
  # @return [App]
  def self.app
    App.instance
  end

  # Setup Grail app environment and expose dir paths
  class App
    include Singleton

    attr_accessor :version
    attr_reader :root

    delegate :autoload_paths=, :autoload_paths, to: ActiveSupport::Dependencies

    def self.start(environment, root_path, version = '0.0.1')
      instance.tap do |app|
        app.version = version
        app.root    = root_path
        app.env     = environment
        app.setup_db
        app.load_dotenv
      end
    end

    def root=(path)
      @root = Pathname.new(path)
    end

    def env=(env = nil)
      @env = env.to_sym if env
    end

    def env
      @env || :production
    end

    def config_dir
      root.join('config')
    end

    def db_dir
      root.join('db')
    end

    def db_migrate_dir
      db_dir.join('migrate')
    end

    def db_config
      @db_config ||= YAML.safe_load(
        File.read(config_dir.join('database.yml')),
        [],
        [],
        true
      )
    end

    def load_dotenv
      Dotenv.load(".env.#{env}", '.env')
    end

    def setup_db
      ActiveRecord::Base.configurations = db_config
      ActiveRecord::Base.establish_connection(env)
    end
  end
end

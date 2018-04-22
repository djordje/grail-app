# frozen_string_literal: true

require 'yaml'
require 'dotenv'
require 'active_record'
require 'active_support/dependencies'

module Grail
  class App
    include Singleton

    attr_reader :root

    delegate :autoload_paths=, :autoload_paths, to: ActiveSupport::Dependencies

    def self.start(environment, root_path)
      instance.tap do |app|
        app.root = root_path
        app.env  = environment
        app.setup_db
        app.load_dotenv
      end
    end

    def root=(path)
      @root = Pathname.new(path)
    end

    def env=(e = nil)
      @env = e.to_sym if e
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
      @db_config ||= YAML.load(File.read(config_dir.join('database.yml')))
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

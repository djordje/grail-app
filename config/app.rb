# frozen_string_literal: true

require 'yaml'
require 'dotenv'
require 'active_record'
require 'active_support/dependencies'

CONFIG_DIR = File.expand_path('../', __FILE__)
DB_DIR     = File.expand_path('../db', CONFIG_DIR)
APP_ENV    = (ENV['RACK_ENV'] || 'production').to_sym
DB_CONFIG  = YAML.load(File.read(File.join(CONFIG_DIR, 'database.yml')))

Dotenv.load(".env.#{APP_ENV}", '.env')

ActiveSupport::Dependencies.autoload_paths += %w[http]
ActiveRecord::Base.configurations = DB_CONFIG
ActiveRecord::Base.establish_connection(APP_ENV)

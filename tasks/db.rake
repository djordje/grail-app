# frozen_string_literal: true

require 'active_record'
require_relative '../config/app'

include ActiveRecord::Tasks

DatabaseTasks.env                    = APP_ENV.to_s
DatabaseTasks.db_dir                 = DB_DIR
DatabaseTasks.database_configuration = DB_CONFIG
DatabaseTasks.migrations_paths       = File.join(DB_DIR, 'migrate')

load 'active_record/railties/databases.rake'

# frozen_string_literal: true

desc 'Load environment'
task :environment do
  require 'active_record'
  require_relative '../config/initialize'

  include ActiveRecord::Tasks

  DatabaseTasks.env                    = Grail::App.instance.env.to_s
  DatabaseTasks.db_dir                 = Grail::App.instance.db_dir
  DatabaseTasks.migrations_paths       = Grail::App.instance.db_migrate_dir
  DatabaseTasks.database_configuration = Grail::App.instance.db_config
end

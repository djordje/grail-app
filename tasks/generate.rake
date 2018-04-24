# frozen_string_literal: true

namespace :generate do
  desc 'Generate migration'
  task :migration, [:name] => [:environment] do |_t, args|
    migration = <<~RUBY
      class #{args[:name]} < ActiveRecord::Migration[5.2]
        def change
        end

        def up
        end

        def down
        end
      end
    RUBY
    file_name = "#{Time.now.to_i}_#{args[:name].underscore}.rb"
    File.write(File.join(Grail.app.db_dir, 'migrate', file_name), migration)
  end
end

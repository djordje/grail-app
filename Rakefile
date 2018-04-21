# frozen_string_literal: true

require 'rake'

desc 'Load environment'
task :environment do
  require_relative 'config/app'
end

Dir['tasks/**/*.rake'].each do |path|
  load path
end

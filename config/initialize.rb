# frozen_string_literal: true

require_relative '../grail/app'
require_relative '../grail/rails_fixtures'

app = Grail::App.start(
  ENV['RACK_ENV'],
  File.expand_path('../', File.dirname(__FILE__))
)
app.autoload_paths += %w[http]

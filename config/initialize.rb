# frozen_string_literal: true

require_relative '../grail/app'
require_relative '../grail/rails_fixtures'

app = Grail::App.start(
  ENV['RACK_ENV'],
  File.expand_path('../', File.dirname(__FILE__)),
  '0.0.2'
)
app.autoload_paths += %w[http models]

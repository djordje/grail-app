# Grail App

This is prof of concept which combines __Grape__ and __ActiveRecord__.

In most projects I've been working recently I use Rails and Grape, and I mostly write
APIs in Grape because of generated Swagger documentation.
I use ActiveRecord and DB related Rake tasks from the Rails, which leads me to compose stack
without components I don't use.

Commands

_NOTE_: By default environment is production unless specified differently.

You can set desired environment using `RACK_ENV=something`.
E.g. `RACK_ENV=development rackup`

- `bin/grail console` - IRB in project context with bootstrapped environment
- `rackup` - start Puma web server using
- `shotgun` - start development Puma web server with code reloading feature, sets development environment by default
- `rake db:*` - All ActiveRecord DB tasks
- `rake environment` - Task to setup environment, dependency for ActiveRecord tasks
- `rake generate:migration[name]` - Generate ActiveRecord migration
- `rspec` - Run RSpec, sets test environment by default
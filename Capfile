# Load DSL and Setup Up Stages
require "capistrano/setup"

# Includes default deployment tasks
require "capistrano/deploy"


DEPLOYMENT_CONFIG = YAML.load_file("./config/config.yml")["development"]

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require "capistrano/chruby"
# require "capistrano/rbenv"

# Ref: https://github.com/capistrano/bundler
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"

# Ref: https://github.com/capistrano/rvm
require "capistrano/rvm"

# Ref: https://github.com/rvm/rvm1-capistrano3
require "rvm1/capistrano3"

# Loads custom tasks from lib/capistrano/tasks if you have any defined.
Dir.glob("lib/capistrano/tasks/*.cap").each { |r| import r }

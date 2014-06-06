# Load DSL and Setup Up Stages
require "capistrano/setup"

# Includes default deployment tasks
require "capistrano/deploy"

# Ref: https://github.com/capistrano/rails#usage
require "capistrano/rails"

# Ref: https://github.com/rvm/rvm1-capistrano3#usage
require 'rvm1/capistrano3'

# Loads custom tasks from `lib/capistrano/tasks" if you have any defined.
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

DEPLOYMENT_CONFIG = YAML.load_file("./config/config.yml")["development"]

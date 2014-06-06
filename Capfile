# Load DSL and Setup Up Stages
require "capistrano/setup"

# Includes default deployment tasks
require "capistrano/deploy"

# Ref: https://github.com/capistrano/rails#usage
require "capistrano/rails"

# Loads custom tasks from `lib/capistrano/tasks" if you have any defined.
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

DEPLOYMENT_CONFIG = YAML.load_file("./config/config.yml")["development"]

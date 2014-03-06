# config valid only for Capistrano 3.1
lock "3.1.0"




# Deployment dependencies
# Ref: https://github.com/capistrano/capistrano/wiki/Capistrano-Tasks#deploycheck
depend :remote, :command, "bundle"  # Bundler
depend :remote, :command, "convert" # ImageMagick
depend :remote, :command, "git"     # Git
depend :remote, :command, "mysql"   # MariaDB
depend :remote, :command, "node"    # nodejs
depend :remote, :command, "rake"    # Rake
depend :remote, :command, "rvm"     # RVM
depend :remote, :gem, "bundler", "#{DEPLOYMENT_CONFIG["miniumum_version_of_bundler"]}"
depend :remote, :gem, "rake", "#{DEPLOYMENT_CONFIG["miniumum_version_of_rake"]}"




set :application, DEPLOYMENT_CONFIG["application_name"]
set :applications_folder, DEPLOYMENT_CONFIG["applications_folder"]
set :bundle_without, [:darwin, :development, :test]
set :gemset_name, DEPLOYMENT_CONFIG["gemset_name"]
set :ruby_version, DEPLOYMENT_CONFIG["ruby_version"]
set :rvm_ruby_gemset, "#{ruby_version}@#{gemset_name}"
set :rvm_ruby_string, "#{rvm_ruby_gemset}"
set :user, DEPLOYMENT_CONFIG["user"]




set :scm, :git
set :use_sudo, false




set :asset_vault_path, DEPLOYMENT_CONFIG["asset_vault_path"]

set :linked_dirs, %w{
  app/assets/images
  app/assets/pdfs
  bin
  log
  public/system
  tmp/cache
  tmp/pids
  tmp/sockets
  vendor/bundle
}

set :linked_files, %w{
  config/config.yml
  config/database.yml
}

# https://github.com/collectiveidea/delayed_job/wiki/Delayed-Job-tasks-for-Capistrano-3
set :delayed_job_server_role, :worker
set :delayed_job_args, "-n 2"




namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join("tmp/restart.txt")

      invoke 'delayed_job:restart'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, "cache:clear"
      # end
    end
  end

  desc "Setup shared directory."
  task :setup_shared do
    run "mkdir #{shared_path}/config"
    put File.read("config/examples/config/config.yml"), "#{shared_path}/config/config.yml"
    put File.read("config/examples/database/database.yml"), "#{shared_path}/config/database.yml"
    #put File.read("config/examples/twitter.yml"), "#{shared_path}/config/twitter.yml"
    puts "Please edit the config files in #{shared_path}/config."
  end

  desc "Set up externalised asset folders."
  task :setup_asset_vault do
    puts "Creating asset folders in #{asset_vault_path}/#{application}"

    run "mkdir -p #{asset_vault_path}/#{application}/Images/"
    run "mkdir -p #{asset_vault_path}/#{application}/PDFs/"

    run "chown -R #{user}:#{user} #{asset_vault_path}"
  end

  desc "Symlink extra configs and folders."
  task :symlink_extras do
    run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    #run "ln -nfs #{shared_path}/config/twitter.yml #{release_path}/config/twitter.yml"
  end
end




# Synchronise assets
before "deploy:assets:precompile", "deploy:sync_assets"





after 'deploy:publishing', 'deploy:restart'

# Ref: http://gist.github.com/293302
server DEPLOYMENT_CONFIG["virtual_server_name"], user: DEPLOYMENT_CONFIG["deploy_user"], roles: [:web, :app, :db]
set :deployment_path, DEPLOYMENT_CONFIG["virtual_deployment_path"]
set :deploy_to, "#{fetch(:applications_folder)}/#{fetch(:application)}/#{fetch(:deployment_path)}"

# Don't forget to make this repo on the server
set :repository_server_name, DEPLOYMENT_CONFIG["virtual_server_name"]
set :repo_url, "#{fetch(:deploy_user)}@#{fetch(:repository_server_name)}:/var/Repositories/Git/#{fetch(:application)}.git"
# Don't forget to make this branch in the repository
set :branch, DEPLOYMENT_CONFIG["virtual_repository_deployment_branch"]

set :rails_env, :production




# Deployment dependencies
# Ref: https://github.com/capistrano/capistrano/wiki/Capistrano-Tasks#deploycheck
#depend :remote, :writable, "#{fetch(:asset_vault_path)}/#{fetch(:application)}/Images/"
#depend :remote, :writable, "#{fetch(:asset_vault_path)}/#{fetch(:application)}/PDFs/"




namespace :deploy do
  desc "Synchronise assets"
  task :sync_assets do
    # Upload assets to the AssetsVault
    run_locally do
    	execute "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded ~/Projects/Rails/#{fetch(:application)}/app/assets/images/ #{fetch(:deploy_user)}@#{DEPLOYMENT_CONFIG["virtual_server_name"]}:#{fetch(:asset_vault_path)}/#{fetch(:application)}/Images/"
    	execute "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded ~/Projects/Rails/#{fetch(:application)}/app/assets/pdfs/ #{fetch(:deploy_user)}@#{DEPLOYMENT_CONFIG["virtual_server_name"]}:#{fetch(:asset_vault_path)}/#{fetch(:application)}/PDFs/"
    end

    # Copy assets from the AssetsVault to the shared assets path for the deployed application
    on roles(:app) do
      # Execute rsync to synchronise assets from the AssetsVault
      %x("rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded #{fetch(:asset_vault_path)}/#{fetch(:application)}/Images/ #{fetch(:shared_path)}/images/")
      %x("rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded #{fetch(:asset_vault_path)}/#{fetch(:application)}/PDFs/ #{fetch(:shared_path)}/pdfs/")
  	end
  end
end

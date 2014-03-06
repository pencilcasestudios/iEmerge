# Ref: http://gist.github.com/293302
server DEPLOYMENT_CONFIG["virtual_server_name"], roles: [:web, :app, :db]
set :deployment_path, DEPLOYMENT_CONFIG["virtual_deployment_path"]
set :deploy_to, "#{fetch(:applications_folder)}/#{fetch(:application)}/#{fetch(:deployment_path)}"

# Don't forget to make this repo on the server
set :repository_server_name, DEPLOYMENT_CONFIG["virtual_server_name"]
set :repo_url, "#{fetch(:user)}@#{fetch(:repository_server_name)}:/var/Repositories/Git/#{fetch(:application)}.git"
# Don't forget to make this branch in the repository
set :branch, DEPLOYMENT_CONFIG["virtual_repository_deployment_branch"]




# Deployment dependencies
# Ref: https://github.com/capistrano/capistrano/wiki/Capistrano-Tasks#deploycheck
#depend :remote, :writable, "#{fetch(:asset_vault_path)}/#{fetch(:application)}/Images/"
#depend :remote, :writable, "#{fetch(:asset_vault_path)}/#{fetch(:application)}/PDFs/"




namespace :deploy do
  desc "Synchronise assets"
  task :sync_assets do
    # Upload assets to the AssetsVault
    run_locally "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded ~/Projects/Rails/Galaunia/app/assets/images/ #{fetch(:user)}@#{DEPLOYMENT_CONFIG["virtual_server_name"]}:#{fetch(:asset_vault_path)}/#{fetch(:application)}/Images/"
    run_locally "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded ~/Projects/Rails/Galaunia/app/assets/pdfs/ #{fetch(:user)}@#{DEPLOYMENT_CONFIG["virtual_server_name"]}:#{fetch(:asset_vault_path)}/#{fetch(:application)}/PDFs/"

    # Copy assets from the AssetsVault to the shared assets path for the deployed application
    run "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded #{fetch(:asset_vault_path)}/#{fetch(:application)}/Images/ #{fetch(:shared_path)}/images/"
    run "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded #{fetch(:asset_vault_path)}/#{fetch(:application)}/PDFs/ #{fetch(:shared_path)}/pdfs/"
  end
end

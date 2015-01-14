set :application, "cebucondo"
set :domain, "106.186.120.245:12001"
set :server_hostname, 'www.cebucondo.ph'

server domain, :app, :web, :db, :primary => true

set :user, "cebucond"
set :password, "bKY06wd6v5"

set :repository,  "git@github.com:leslietes/CCL.git"
set :scm, :git
set :scm_username, "leslietes"
set :scm_password, "secret"
set :set_verbose, true
set :deploy_to, "/rails_apps/#{application}"
set :use_sudo, false
set :deploy_via, :checkout
set :keep_releases, 2
set :branch, :master

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :runner, "leslietes"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :chmod755, "app config db lib public vendor script script/* public/*"

#role :web, application                          # Your HTTP server, Apache/etc
#role :app, application                          # This may be the same as your `Web` server
#role :db,  application, :primary => true        # This is where Rails migrations will run
#role :db,  application

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
#  task :start {}
#  task :stop {}
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
#  task :before_update_code, :roles => :app do
#    run "whoami"
#  end
end

#release_path is recomputed every time Capistrano is invoked, and is
#only valid for a deploy that is IN PROGRESS.

#current_path, on the other hand, always points to the 'current' symlink.

#current_release is always the most recent release in the releases directory.

#Lastly, latest_release is the same as release_path if a deploy is in
#progress, or current_release if not. 

namespace :configure do
  desc "Store database.yml in shared folder and create symlink"
  task :database, :roles => :app do
    run "ln -nfs #{shared_path}/system/database.yml #{current_release}/config/database.yml"
  end

  desc "Create symlink to shared/system folder for uploads"
  task :assets, :roles => :app do
    run "ln -nfs #{shared_path}/system/properties #{current_release}/public/properties"
    run "ln -nfs #{shared_path}/system/featured #{current_release}/public/images/featured"
    run "ln -nfs #{shared_path}/system/perspectives #{current_release}/public/images/perspectives"
    run "ln -nfs #{shared_path}/system/developers #{current_release}/public/developers"
  end
end

after 'deploy:update', 'configure:assets'

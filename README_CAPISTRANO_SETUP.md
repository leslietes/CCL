== Capistrano Setup

**Note: All the commands mentioned below are to be executed from your Rails application root directory.**

1. Install Capistrano's latest stable version by running following command:

```
  $ gem install capistrano
``

2. Capify the application by running following command:

```
  $ cap install
```

  The output of above command should look like:

```
  mkdir -p config/deploy
  create config/deploy.rb
  create config/deploy/staging.rb
  create config/deploy/production.rb
  mkdir -p lib/capistrano/tasks
  create Capfile
  Capified

```

3. Download [capistrano-3-rails-template zip file](https://github.com/TalkingQuickly/capistrano-3-rails-template/archive/master.zip)
   and extract to a desired location say `~/capistrano-3-rails-template-master`.

4. Copy all `*.cap` files from `~/capistrano-3-rails-template-master/lib/capistrano/tasks` folder to
   `<RAILS_APP_ROOT>/lib/capistrano/tasks` folder.

5. Copy each `*.rb` file from `~/capistrano-3-rails-template-master/lib/capistrano` folder to
   `<RAILS_APP_ROOT>/lib/capistrano` folder.

6. Open `<RAILS_APP_ROOT>Capfile` file in a text editor and add following lines at the bottom of the file, if not present:

```
    Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
    Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }
```

7. Create a folder named `shared` under `<RAILS_APP_ROOT>/config/deploy`.

8. Copy `~/capistrano-3-rails-template-master/config/deploy/shared/database.example.yml.erb to `<RAILS_APP_ROOT>/config/deploy/shared` folder.

9. Open `<RAILS_APP_ROOT>/config/deploy.rb` in a text editor and replace the existing content with following content:

```
    # config valid only for current version of Capistrano
    lock '3.3.5'

    # Including any non-standard paths
    set :default_env, { path: "/usr/local/cpanel/3rdparty/bin/git:$PATH" }

    # Required for using git installed on a non-standard path. The standard
    # path is usually /usr/bin/git
    # The solution clicked while going through an answer
    # mentioning
    #   set :scm_command, "/home/your_cap_runner_user/bin/git"
    # in following post http://stackoverflow.com/questions/279705/using-capistrano-when-remote-git-is-on-a-non-standard-path
    # That pertains to older Capistrano version and for Capistrano 3 found the
    # reference to set it in https://github.com/capistrano/sshkit/blob/master/EXAMPLES.md#using-with-rake
    SSHKit.config.command_map[:git]  = "/usr/local/cpanel/3rdparty/bin/git"

    # Set your application name
    set :application, 'cebucondo'

    # Set the SSH user name of remote server on which deployment is to be done
    set :deploy_user, 'cebucond'

    # Required for avoiding following error on a shared host:
    #  DEBUG [39b5a7b9] Command: ( PATH=/usr/local/cpanel/3rdparty/bin/git:$PATH GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/cebucondo/git-ssh.sh /usr/local/cpanel/3rdparty/bin/git ls-remote --heads git@github.com:leslietes/CCL.git )
    #  DEBUG [39b5a7b9]  stdin: is not a tty
    #  DEBUG [39b5a7b9]  fatal: cannot exec '/tmp/cebucondo/git-ssh.sh': Permission denied
    #  DEBUG [39b5a7b9]  fatal: unable to fork
    # Reference: https://community.webfaction.com/questions/15144/capistrano-3-deploys-fatal-error-executing-tmpmyappgit-sshsh
    # Note the fix for above error also requires exporting GIT_SSH environment variable pointing to tmp_dir path
    # set below.And also you should create tmp_dir path on remote server, if it doesn't exists.
    set :tmp_dir, "/home/#{fetch(:deploy_user)}/tmp"

    # Setup repository details
    set :scm, :git
    set :repo_url, 'git@github.com:leslietes/CCL.git'

    # how many old releases do we want to keep
    set :keep_releases, 5

    # files we want symlinking to specific entries in shared.
    set :linked_files, %w{config/database.yml}

    # dirs we want symlinking to shared
    set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

    # which config files should be copied by deploy:setup_config
    # see documentation in lib/capistrano/tasks/setup_config.cap
    # for details of operations
    set(:config_files, %w(
      database.example.yml
    ))

    # which config files should be made executable after copying
    # by deploy:setup_config. Example:

    #set(:executable_config_files, %w(
    #  unicorn_init.sh
    #))

    # Note: This needs to be set even if you don't have any file.Without this
    # variable in place capistrano/tasks/setup_config.cap breaks with error
    # undefined method `each' for nil:NilClass @ line number 21
    set(:executable_config_files, [])

    # files which need to be symlinked to other parts of the
    # filesystem. For example nginx virtualhosts, log rotation
    # init scripts etc. Example:

    #set(:symlinks, [
    #  {
    #    source: "nginx.conf",
    #    link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
    #  },
    #  {
    #    source: "unicorn_init.sh",
    #    link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
    #  },
    #  {
    #    source: "log_rotation",
    #   link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
    #  },
    #  {
    #    source: "monit",
    #    link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
    #  }
    #])

    # Note: This needs to be set even if you don't have any file.Without this
    # variable in place capistrano/tasks/setup_config.cap breaks with error
    # undefined method `each' for nil:NilClass @ line number 28
    set(:symlinks, [])

    namespace :deploy do
      # make sure we're deploying what we think we're deploying
      before :deploy, "deploy:check_revision"

      after :finishing, 'deploy:cleanup'

      # As of Capistrano 3.1, the `deploy:restart` task is not called
      # automatically.
      after 'deploy:publishing', 'deploy:restart'
    end

    # ========= DEFAULT GENERATED BY CAPISTRANO
    # Default branch is :master
    # ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

    # Default deploy_to directory is /var/www/my_app_name
    # set :deploy_to, '/var/www/my_app_name'

    # Default value for :scm is :git
    # set :scm, :git

    # Default value for :format is :pretty
    # set :format, :pretty

    # Default value for :log_level is :debug
    # set :log_level, :debug

    # Default value for :pty is false
    # set :pty, true

    # Default value for :linked_files is []
    # set :linked_files, fetch(:linked_files, []).push('config/database.yml')

    # Default value for linked_dirs is []
    # set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

    # Default value for default_env is {}
    # set :default_env, { path: "/opt/ruby/bin:$PATH" }

    # Default value for keep_releases is 5
    # set :keep_releases, 5

    #namespace :deploy do
    #
    #  after :restart, :clear_cache do
    #    on roles(:web), in: :groups, limit: 3, wait: 10 do
    #      # Here we can do anything such as:
    #      # within release_path do
    #      #   execute :rake, 'cache:clear'
    #      # end
    #    end
    #  end
    #
    #end
```
10. Open `<RAILS_APP_ROOT>/config/deploy/production.rb` in a text editor and replace the existing content with following content.
    The configuration shown below is for Rails Production environment and it can be overridden for other environments like Staging.

```
  set :stage, :production
  set :branch, "master"

  # used in case we're deploying multiple versions of the same
  # app side by side. Also provides quick sanity checks when looking
  # at filepaths
  set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

  server '106.186.120.245',
          user: "#{fetch(:deploy_user)}",
          roles: %w{web app db},
          primary: true,
          port: 2022

  set :deploy_to, "/home/#{fetch(:deploy_user)}/rails_apps/#{fetch(:full_app_name)}"

  # dont try and infer something as important as environment from
  # stage name.
  set :rails_env, :production

  # Simple Role Syntax
  # ==================
  # Supports bulk-adding hosts to roles, the primary server in each group
  # is considered to be the first unless any hosts have the primary
  # property set.  Don't declare `role :all`, it's a meta role.

  #role :app, %w{deploy@example.com}
  #role :web, %w{deploy@example.com}
  #role :db,  %w{deploy@example.com}


  # Extended Server Syntax
  # ======================
  # This can be used to drop a more detailed server definition into the
  # server list. The second argument is a, or duck-types, Hash and is
  # used to set extended properties on the server.

  #server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

  # Custom SSH Options
  # ==================
  # You may pass any option but keep in mind that net/ssh understands a
  # limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
  #
  # Global options
  # --------------
  #  set :ssh_options, {
  #    keys: %w(/home/rlisowski/.ssh/id_rsa),
  #    forward_agent: false,
  #    auth_methods: %w(password)
  #  }
  #
  # And/or per server (overrides global)
  # ------------------------------------
  # server 'example.com',
  #   user: 'user_name',
  #   roles: %w{web app},
  #   ssh_options: {
  #     user: 'user_name', # overrides user setting above
  #     keys: %w(/home/user_name/.ssh/id_rsa),
  #     forward_agent: false,
  #     auth_methods: %w(publickey password)
  #     # password: 'please use keys'
  #   }
```
11. The configuration shown below is for Rails Staging environment added in `<RAILS_APP_ROOT>/config/deploy/staging.rb`.

```
    set :stage, :staging
    set :branch, "staging"

    # used in case we're deploying multiple versions of the same
    # app side by side. Also provides quick sanity checks when looking
    # at filepaths
    set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

    server '106.186.120.245',
            user: "#{fetch(:deploy_user)}",
            roles: %w{web app db},
            primary: true,
            port: 2022

    set :deploy_to, "/home/#{fetch(:deploy_user)}/rails_apps/#{fetch(:full_app_name)}"

    # dont try and infer something as important as environment from
    # stage name.
    set :rails_env, :staging
```
12. Once you're happy with the contents of the configuration files, then you copy them
    to your production server by running following command:

```
  cap production deploy:setup_config
```

  For copying them to your staging server you should run following command:

```
  cap staging deploy:setup_config
```

  The above command should produce output like following:

```
    ** Invoke production (first_time)
    ** Execute production
    ** Invoke load:defaults (first_time)
    ** Execute load:defaults
    ** Invoke deploy:setup_config (first_time)
    ** Execute deploy:setup_config
    INFO [40d2b17a] Running /usr/bin/env mkdir -p /home/cebucond/rails_app/cebucondo_production/shared/config as cebucond@106.186.120.245
    DEBUG [40d2b17a] Command: /usr/bin/env mkdir -p /home/cebucond/rails_app/cebucondo_production/shared/config
    Text will be echoed in the clear. Please install the HighLine or Termios libraries to suppress echoed text.
    cebucond@106.186.120.245's password: <ENTER YOUR SSH USER NAME PASSWORD HERE WHEN PROMPTED>
    DEBUG [40d2b17a]    stdin: is not a tty
    INFO [40d2b17a] Finished in 13.523 seconds with exit status 0 (successful).
    DEBUG Uploading /home/cebucond/rails_app/cebucondo_production/shared/config/database.example.yml 0.0%
    INFO Uploading /home/cebucond/rails_app/cebucondo_production/shared/config/database.example.yml 100.0%
    INFO copying: #<StringIO:0x00000000d2a578> to: /home/cebucond/rails_app/cebucondo_production/shared/config/database.example.yml
```

13. SSH into your remote server and cd into shared/config to create a database.yml from the example:

```
  $ ssh -v cebucond@106.186.120.245 -p 2022
  cebucond@106.186.120.245's password: <ENTER YOUR SSH USER NAME PASSWORD HERE WHEN PROMPTED>

  cebucond@cebucondo.ph [~]# cd /home/cebucond/rails_apps/cebucondo_production/shared/config
  cebucond@cebucondo.ph [~/rails_apps/cebucondo_production/shared/config]# cp database.yml.example database.yml
  cebucond@cebucondo.ph [~/rails_apps/cebucondo_production/shared/config]# vi database.yml

  Make the necessary changes in ~/rails_apps/cebucondo_production/shared/config/database.yml and save them.
```

14. You are now ready to deploy.Return to your local terminal, ensure that you've committed your changes and
    pushed changes to the remote repository and enter:

```
  $ cap production deploy
```

References:

* http://capistranorb.com/documentation/getting-started/flow/
* http://corlewsolutions.com/articles/article-10-how-to-deploy-rails-applications-using-capistrano-3-1-and-windows-7
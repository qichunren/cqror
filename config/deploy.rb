set :application, "cqror.com's rails code"
set :repository,  "qichunren@109.74.204.219:/home/qichunren/repos/cqror.git"

set :scm, :git
set :deploy_to, "/home/qichunren/www/cqror"
set :user, "qichunren"
set :password, "qichunren"
set :use_sudo, false
default_run_options[:pty] = true

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "109.74.204.219", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

after "deploy:update", "deploy:prepare"

namespace :deploy do

  task :prepare, :roles => :app do
    run "cp /home/qichunren/conf/database.yml #{current_path}/config/database.yml"
  end

end

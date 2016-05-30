require "rvm/capistrano"
require "bundler/capistrano"
load 'deploy/assets'

set :application, "bloodbank"
# set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user,     "deployer"
set :group,    "staff"
set :password, "ghfdbkfpjcgr"
#set :use_sudo, false

set :deploy_to,  "/home/#{user}/#{application}"
set :bundle_dir, File.join(fetch(:shared_path), 'gems')
role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :rvm_ruby_string, "1.9.3@default"
set :rvm_type, :system
set :rails_env, 'production'

set :rake,       "rvm use #{rvm_ruby_string} do bundle exec rake --trace"
set :bundle_cmd, "rvm use #{rvm_ruby_string} do bundle"

task :set_current_release, :roles => :app do
  set :current_release, latest_release
end

set :unicorn_conf,      "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid,       "#{deploy_to}/current/tmp/#{application}.pid"
set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec rake db:seed RAILS_ENV=production"
  end

  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end
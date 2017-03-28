# Change these

require 'capistrano-db-tasks'

set :repo_url,        'git@github.com:Koodit/new_pickapp.git'
set :application,     'pickapp'
set :user,            'koodit'

set :rvm_ruby_version, '2.3.1'

# Don't change these unless you know what you're doing
set :pty, false
set :use_sudo, false
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/db.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
      puts 'Adding nginx.conf to sites-available in /etc/nginx/sites-enabled'
      execute "ln -nfs /home/#{fetch(:user)}/apps/#{fetch(:application)}/current/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
    end
  end

  after :restart, :clear_cache do
    invoke 'reindex:all'
  end
end

namespace :reindex do
  desc "Invoke rake task"
  task :all do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
         execute :rake, 'searchkick:reindex CLASS=Room RAILS_ENV=production'
      end
    end
  end
end

# namespace :searchkick do
#   desc 'Initial Deploy'
#   task :reindex do
#     on roles(:app), in: :groups, limit: 3, wait: 10 do
#       invoke 'rake searchkick:reindex CLASS=Room'
#     end
#   end
# end
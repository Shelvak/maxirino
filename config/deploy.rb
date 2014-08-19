set :application, 'maxirino'
set :user, 'rotsen'
set :repo_url, 'https://github.com/Shelvak/maxirino.git'

set :scm, :git
set :branch, 'master'
set :deploy_to, '/var/rails/maxirino'
set :deploy_via, :remote_cache

set :format, :pretty
set :log_level, :debug

set :linked_files, %w{config/app_config.yml config/secrets.yml}
set :linked_dirs, %w{log private}

set :keep_releases, 5

set :rbenv_type, :user
set :rbenv_ruby, '2.1.2'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end

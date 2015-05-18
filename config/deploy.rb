set :repo_url, 'git@github.com:castiron/parcel.git'

# Branch options
# Prompts for the branch name (defaults to current branch)
#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Sets branch to current one
#set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Hardcodes branch to always be master
# This could be overridden in a stage config file

set :deploy_to, -> { "#{fetch(:application)}" }

set :log_level, :info

namespace :deploy do
  desc 'Post deploy script (currently just updates custom colors for all sites)'
  task :post_deployment do
    on roles(:app), in: :sequence, wait: 5 do
    execute "bash #{fetch(:application)}/current/debs/setup.sh"
  end
end
end

after 'deploy:publishing', 'deploy:post_deployment'

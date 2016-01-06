require 'capistrano/ext/multistage'

role :web,"203.135.63.149"
role :app,"203.135.63.149"
role :db,"203.135.63.149",:primary=>true
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :application, "OMSAD"
set :scm, :subversion
set :repository, "https://203.135.63.150:8443/svn/development/dssd_summer2012_team2/OMSAD_Sprint6_Staging/"
set :user, "root"
set :scm_username , "adnan.ashraf"
set :scm_password ,"ada1234"
default_run_options[:pty] = true

after 'deploy:update_code' do
  #run "cd #{release_path}; RAILS_ENV=production rake assets:precompile --trace"
  #run "cd #{release_path}; RAILS_ENV=production rake db:seed"

end

set :application, "myblog"
set :user, 'username'
set :host, 'your.webserver.hostname'
set :host_path, '/www/#{application}/'

# From: http://wiki.capify.org/index.php/Neutralise_Capistrano_Default_Methods
namespace :deploy do
  [:setup, :update, :update_code, :finalize_update, :symlink, :restart].each do |default_task|
    task default_task do 
      # Neutralize default tasks
    end
  end
end

desc "Use rsync to transfer updated content to the server."
namespace :deploy do
  task :default do
    `rsync -rvztL -e ssh "htdocs/" "#{user}@#{host}:#{host_path}" --exclude ".git"`
  end
end


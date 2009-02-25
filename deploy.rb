set :application, "myblog"
set :user, 'username'
set :repository,  "git://github.com/<username>/sbg.git"
set :scm, :git
set :checkout, "export"
set :deploy_via, :copy
set :branch, "master"

set :copy_cache, true
set :copy_exclude, ".git/*"
#set :copy_cache, "/u/caches/#{application}"

# require a remote file's existence
#depend :remote, "/etc/syslog.conf"

set :base_path, "/www"
set :deploy_to, "/www/#{application}"

role :app,     "hostname"
role :web,     "hostname"
role :db,      "hostname", :primary => true

# TODO: override deploy tasks to point to update_content

desc "Use rsync to transfer updated content to the server."
task :update_content do
  username = 'username' # user || ENV['USER']
  server = 'hostname'
  content_release_path = '/www/madscience/'
  `rsync -avzL -e ssh "./htdocs" "#{username}@#{server}:#{content_release_path}" --exclude ".git"`
end


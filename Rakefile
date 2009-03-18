require 'pixiedust'
desc "run heel on port 6666 to test"
task :heel do
  `heel -p 6666 -r ./htdocs --no-highlighting --no-launch-browser`
end

desc "make a tarball"
task :archive do
  blogname = "myblog-#{DateDust.now_str}"
  `git archive --format=tar --prefix=#{blogname}/ HEAD | gzip >#{blogname}.tar.gz`
end

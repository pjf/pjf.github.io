# Based upon the code at
# http://ixti.net/software/2013/01/28/using-jekyll-plugins-on-github-pages.html

require 'rubygems'
require 'tmpdir'
require 'bundler/setup'
require 'jekyll'

# TODO: auto-detect this
GITHUB_REPONAME = 'pjf/pjf.github.io'

desc "Generate site"
task :default do
    Jekyll::Site.new(Jekyll.configuration({
        'source'      => '.',
        'destination' => '_site',
    })).process
end

desc "Generate and publish"
task :publish => [:default] do
  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp

    pwd = Dir.pwd
    Dir.chdir tmp

    system "git init"
    system "git add ."
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master --force"

    Dir.chdir pwd
  end
end

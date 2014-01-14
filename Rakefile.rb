require 'rubygems'
require 'tmpdir'
require 'bundler/setup'
require 'jekyll'

desc "Generate site"
task :default do
    Jekyll::Site.new(Jekyll.configuration({
        'source'      => '.',
        'destination' => '_site',
    })).process
end



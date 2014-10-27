require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'

task :default => :run

desc 'Run unit test'
task :test => :spec

if !defined?(RSpec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    #t.pattern = 'spec/**/*_spec.rb' # not needed this is default
    t.rspec_opts = ['-cfs']
  end
end

namespace :db do
  desc 'Auto-migrate the database (destroys data)'
  task :migrate => :env do
    DataMapper.auto_migrate!
  end

  desc 'Auto-upgrade the database (preserves data)'
  task :upgrade => :env do
    DataMapper.auto_upgrade!
  end
end

task :env do
  require File.join(File.dirname(__FILE__), 'env')
end

desc 'Start the web server by rackup'
task :run do
  sh 'rackup -p 4567'
end

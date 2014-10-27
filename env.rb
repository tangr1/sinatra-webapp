require 'rubygems'
require 'bundler/setup'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'ostruct'
require 'yaml'

require 'sinatra' unless defined?(Sinatra)

Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each do |file|
  require file
end

Dir[File.dirname(__FILE__) + '/models/*.rb'].each do |file|
  require file
end

DataMapper.finalize

Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each do |file|
  require file
end

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Test web application',
                 :author => 'Rui Tang',
                 :url_base => 'http://localhost:4567/'
               )
  dbconf = YAML.load_file(File.dirname(__FILE__)+'/config/database.yaml')

  case dbconf['adapter']
    when 'sqlite3'
      DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/db/application.db")
  end

end

require 'sinatra/base'
require File.join(File.dirname(__FILE__), 'env')

configure :development do
  DataMapper::Logger.new($stdout, :debug)
end

use Rack::Session::Pool, :expire_after => 2592000

configure do
  set :root          , File.dirname(__FILE__)
  set :public_folder , File.dirname(__FILE__) + '/public'
  set :views         , File.dirname(__FILE__) + '/views'
  set :app_file      , __FILE__
  set :dump_errors   , true
  set :logging       , true
  set :raise_errors  , true

  enable :sessions
end

error do
  logger.error env['sinatra.error'].message
  redirect to('500.html')
end

not_found do
  redirect to('404.html')
end

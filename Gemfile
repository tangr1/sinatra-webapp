source 'https://rubygems.org'
ruby '1.9.3'

gem 'rack', '1.5.2'
gem 'unicorn'
gem 'sinatra', '1.4.3'
gem 'rake'
gem 'logger'
gem 'data_mapper'
gem 'dm-timestamps'
gem 'dm-validations'
gem 'dm-aggregates'
gem 'dm-migrations'
gem 'yajl-ruby', require: 'yajl'

group :development do
  gem 'sqlite3'   
  gem 'dm-sqlite-adapter'
end

group :test do
  gem 'rspec', :require => 'spec'
  gem 'rack-test'
end

group :production do
  #gem 'dm-mysql-adapter'
  #gem 'dm-postgres-adapter'
end

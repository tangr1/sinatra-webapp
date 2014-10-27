require 'yajl'

get '/users' do
  Yajl::Encoder.encode(User.all)
end

get '/users/:id' do
  Yajl::Encoder.encode(User.first(:id => params[:id]))
end

delete '/users/:id' do
  user = User.first(:id => params[:id])
  if user.nil?
    404
  else
    json = Yajl::Encoder.encode(user)
    user.destroy
    json
  end
end

post '/users' do
  parser = Yajl::Parser.new
  hash = parser.parse(request.body.read)
  user = User.create(:name => hash['name'],
              :email => hash['email'],
              :password => hash['password'],
              :created_at => Time.now)
  Yajl::Encoder.encode(user)
end

put '/users/:id' do
  pass
end

get '/auth/login' do
  erb :login
end

post '/auth/login' do
  @user = User.first(:email => params[:email], :password => params[:password])
  if !@user
    redirect '/auth/login'
  else
    session[:user_id] = @user.id
    session[:authorized] = true
    @user.login_times = @user.login_times + 1
    @user.save
    redirect '/auth/dashboard'
  end
end

get '/auth/signup' do
  redirect '/auth/dashboard' if authorized?
  erb :signup
end

post '/auth/signup' do
  user = User.create(:email => params[:email],
                     :password => params[:password],
                     :created_at => Time.now,
                     :login_times => 1)
  session[:user_id] = user.id
  session[:authorized] = true		

  redirect '/auth/dashboard'
end	

get '/auth/dashboard' do
  @user = User.first(:id => session[:user_id])
  erb :dashboard
end

get '/auth/logout' do
  session[:authorized] = false
  session.clear
  redirect '/'
end

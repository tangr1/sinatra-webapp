get '/' do
  if authorized?
    redirect '/auth/dashboard'
  else
    session[:time] = Time.now
    @time = Time.now.to_s
    p @time
    erb :index
  end
end

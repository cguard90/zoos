get '/login' do
  @user = User.new
  if request.xhr?
    erb :'/login', layout: false
  else
    erb :'/login'
  end
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      @errors = @user.errors.full_messages
      erb :'/login'
    end
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

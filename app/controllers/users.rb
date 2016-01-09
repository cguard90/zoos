get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @surveys = @user.surveys
  erb :'/users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/login'
  end
end

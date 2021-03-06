get '/users/new' do
  @user = User.new
  if request.xhr?
    erb :"users/new", layout: false
  else
    erb :"users/new"
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/users/:id'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  @user = User.find_by(id: session[:user_id])
  @surveys = @user.surveys
  erb :'/users/show'
end



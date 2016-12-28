get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:users])
  if @user.save
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end
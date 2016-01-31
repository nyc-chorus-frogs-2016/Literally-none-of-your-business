get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  # Still need to look up how password confirmation works with BCrypt
  if params[:users]["password1"] == params[:users]["password2"]
    new_user = User.new(username: params[:users]["username"], password: params[:users]["password1"])
    if new_user.save
      register_and_login(new_user)
      redirect "/"
    else
      redirect "/oops"
    end
  else
    @error = "Your passwords don't match!"
    erb :"/oops"
  end
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end

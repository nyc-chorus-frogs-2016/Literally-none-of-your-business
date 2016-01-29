def logged_in?
  !!session[:user_id] && current_user
end

def current_user
  User.find_by(id: session[:user_id])
end

def register_and_login(new_user)
  session[:user_id] = new_user.id
end
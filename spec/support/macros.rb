def set_current_user
  user1 = Fabricate(:user)
  session[:user_id] = user1.id
end
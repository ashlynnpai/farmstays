def set_current_user
  user = Fabricate(:user)
  session[:user_id] = user.id
end

def set_farmer(farmer=nil) #return current value of farmer or create a new farmer
  session[:user_id] = (farmer || Fabricate(:farmer).id)
end

def set_admin(admin=nil) 
  session[:user_id] = (admin || Fabricate(:admin).id)
end
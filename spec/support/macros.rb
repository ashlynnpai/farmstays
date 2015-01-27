def set_current_user
  user1 = Fabricate(:user)
  session[:user_id] = user1.id
end

def set_farmer(farmer=nil) #return current value of farmer or create a new farmer
  session[:user_id] = (farmer || Fabricate(:farmer).id)
end
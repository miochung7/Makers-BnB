class Session
  def self.check(user_id)
    if user_id.class == Integer and user_id
      return true
    else
      return false
    end
  end

  def self.destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect '/'
  end
end

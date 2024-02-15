module SessionsHelper
  
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end

  # Returns the current logged-in user
  def current_user
    if session[:user_id]
      # idiom solution after @current_user = @current_user || User.find_by(id: session[:user_id])
      # notice: если @current_user = nil то присваивается знаечение текущего id,
      # но если id был ранее присвоен сессии то тогда он не изменяется
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # Returns true if the user is logged in, false otherwise
  def logged_in?
    # debugger
    !current_user.nil?
  end
end

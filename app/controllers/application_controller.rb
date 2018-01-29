class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in? # based on this line rails will make these methods available to the view
  # by default application controller methods are available to other controllers but not all views
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # return current_user if it exits || set it as DB response & return the same
  end
  
  def logged_in?
    !!current_user #converting to boolean & returning
  end
  
  def require_user
    if !logged_in? 
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end

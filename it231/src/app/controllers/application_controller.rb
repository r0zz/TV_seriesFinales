class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authorize, except: [:home, :login, :logout, :newuser]
  protected 
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to home_login_path, :notice => 'Please log in'
    end
  end
end

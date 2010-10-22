# coding: utf-8 
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  # get the current logged admin worker.
  def current_user
    return @current_admin if defined?(@current_admin)
    @current_admin = current_user_session && current_user_session.record
  end

  # before fileter for reuqire a logged admin worker.
  def require_user
    unless current_user
      store_location
      flash[:error] = "你还没有登录，请先登录！"
      redirect_to new_blog_panel_user_session_url
      return false
    end
  end

  # store the current url path
  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end

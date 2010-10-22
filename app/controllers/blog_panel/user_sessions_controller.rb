# encoding: utf-8
class BlogPanel::UserSessionsController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :show, :create]
  layout false
  
  def new
    @user_session = UserSession.new
  end

  def show
    redirect_to :action => :new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "登录成功!"
      redirect_back_or_default blog_panel_posts_url
    else
      flash[:warning] = "你输入的帐号或密码不正确!"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "你已安全退出系统!"
    redirect_back_or_default new_admin_session_url
  end

end

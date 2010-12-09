# encoding: utf-8
class BlogPanel::CommentsController < ApplicationController  
  
  before_filter :require_user
  layout "blog_panel"
  
  def index
    @latest_comments = Comment.paginate :page => params[:page], :per_page => 30
  end 
  
  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    
    redirect_to :action => :index
  end
  
end
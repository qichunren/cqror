# encoding: utf-8
class CommentsController < ApplicationController
  
  def create
    if params[:code_image] != session[:code_image]
      render :text => "验证码不正确" and return
    end
    session[:code_image] = nil
    @post = Post.find params[:post_id]
    @comment = @post.comments.build params[:comment]
    @comment.user_ip = request.remote_ip
    
      if @comment.save
        flash[:notice] = "Successfully comment..."
        redirect_to "/myblog/#{@post.to_param}"
      else                                                   
        render :text => "请输入必填项。#{@comment.errors.inspect}" and return
      end
  end


end

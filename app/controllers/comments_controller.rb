# encoding: utf-8
class CommentsController < ApplicationController
  
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build params[:comment]
    @comment.user_ip = request.remote_ip
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = "Successfully comment..."
        format.html { redirect_to "/myblog/#{@post.to_param}" }
      else                                                   
        format.html { render :text => "请输入必填项。#{@comment.errors.inspect}" and return }
      end
       
    end
  end

  def destroy
     
  end

end

class CommentsController < ApplicationController
  
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build params[:comment]
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = "Successfully comment..."
      end
      format.html { redirect_to @post } 
    end
  end

  def destroy
     
  end

end

# encoding: utf-8
class BlogPanel::CommentsController < BlogPanel::BaseQichunrenController 
  

  
  def index
    @latest_comments = Comment.paginate :page => params[:page], :per_page => 30
  end 
  
  def destroy
    @comment = Comment.find params[:id]
    if params[:blanklist] == "true"
      Blacklist.create(:ip => @comment.user_ip, :remark => "email:#{@comment.email} / website:#{@comment.website}")
    end
    @comment.destroy
    
    redirect_to :action => :index
  end
  
end
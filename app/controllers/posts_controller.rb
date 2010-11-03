class PostsController < ApplicationController
  layout "myblog"

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.normal.paginate :page => params[:page], :order => "id DESC"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.normal.find(params[:id])
    @post.click_count += 1
    @post.save
    
    @comments = @post.comments.all
    
    @comment = @post.comments.build
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  # GET /posts/tag/ruby
  def tag
    @posts = Post.normal.tagged_with(params[:id]).paginate :page => params[:page], :order => "id DESC"
  end

end

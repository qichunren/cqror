class PostsController < ApplicationController
  layout "myblog"

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.paginate :page => params[:page], :order => "id DESC"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

end

# encoding: utf-8
class BlogPanel::PostsController < ApplicationController 
  
  before_filter :require_user
  layout "blog_panel"

  # GET /posts
  def index
    @posts = Post.paginate :page => params[:page], :order => "id DESC"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to([:blog_panel, @post], :notice => 'Post was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to([:blog_panel, @post], :notice => 'Post was successfully created.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
     
  # DELETE
  def destroy_comment
    @post = Post.find(params[:id])
    comment = @post.comments.find params[:comment_id]
    comment.destroy
    flash[:notice] = "回复已经删除"
    redirect_to([:blog_panel, @post])
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(blog_panel_posts_url) }
    end
  end
end
class PostsController < ApplicationController  
  respond_to :rss, :only => [:rss]
  layout "myblog"
  
  # cache_pages [:index, :show]

  # GET /myblog
  def index
    @posts = Post.normal.order("id DESC").paginate :page => params[:page], :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /myblog/ruby-is-nice
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
     
  # GET /myblog/feed.rss
  def feed
    @posts = Post.normal.order("id DESC").limit(10)   
    respond_with(@posts) do |format|
      format.rss { render :rss => @posts, :url => "#{root_url}myblog", :title => "Qichunren's blog", :description => "Recording my life", 
        :item => { :title => :title, :description => :content, :item_link => :my_post_path }}
    end
  end
  
  # GET /myblog/tag/ruby
  def tag
    @posts = Post.normal.tagged_with(params[:id]).paginate :page => params[:page], :order => "id DESC"
  end

end
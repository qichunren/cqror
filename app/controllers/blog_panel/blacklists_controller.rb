# encoding: utf-8
class BlogPanel::BlacklistsController < BlogPanel::BaseQichunrenController

  # GET /blacklists
  def index
    @blacklists = Blacklist.paginate :per_page => 40, :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /blacklists/1
  def show
    @blacklist = Blacklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /blacklists/new
  def new
    @blacklist = Blacklist.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /blacklists/1/edit
  def edit
    @blacklist = Blacklist.find(params[:id])
  end

  # POST /blacklists
  def create
    @blacklist = Blacklist.new(params[:blacklist])

    respond_to do |format|
      if @blacklist.save
        format.html { redirect_to([:blog_panel, @blacklist], :notice => 'Blacklist was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /blacklists/1
  def update
    @blacklist = Blacklist.find(params[:id])

    respond_to do |format|
      if @blacklist.update_attributes(params[:blacklist])
        format.html { redirect_to([:blog_panel, @blacklist], :notice => 'Blacklist was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /blacklists/1
  def destroy
    @blacklist = Blacklist.find(params[:id])
    @blacklist.destroy

    respond_to do |format|
      format.html { redirect_to(blog_panel_blacklists_url) }
    end
  end
end

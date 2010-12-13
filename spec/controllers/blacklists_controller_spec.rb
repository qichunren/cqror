require 'spec_helper'

describe BlacklistsController do

  def mock_blacklist(stubs={})
    (@mock_blacklist ||= mock_model(Blacklist).as_null_object).tap do |blacklist|
      blacklist.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all blacklists as @blacklists" do
      Blacklist.stub(:all) { [mock_blacklist] }
      get :index
      assigns(:blacklists).should eq([mock_blacklist])
    end
  end

  describe "GET show" do
    it "assigns the requested blacklist as @blacklist" do
      Blacklist.stub(:find).with("37") { mock_blacklist }
      get :show, :id => "37"
      assigns(:blacklist).should be(mock_blacklist)
    end
  end

  describe "GET new" do
    it "assigns a new blacklist as @blacklist" do
      Blacklist.stub(:new) { mock_blacklist }
      get :new
      assigns(:blacklist).should be(mock_blacklist)
    end
  end

  describe "GET edit" do
    it "assigns the requested blacklist as @blacklist" do
      Blacklist.stub(:find).with("37") { mock_blacklist }
      get :edit, :id => "37"
      assigns(:blacklist).should be(mock_blacklist)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created blacklist as @blacklist" do
        Blacklist.stub(:new).with({'these' => 'params'}) { mock_blacklist(:save => true) }
        post :create, :blacklist => {'these' => 'params'}
        assigns(:blacklist).should be(mock_blacklist)
      end

      it "redirects to the created blacklist" do
        Blacklist.stub(:new) { mock_blacklist(:save => true) }
        post :create, :blacklist => {}
        response.should redirect_to(blacklist_url(mock_blacklist))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved blacklist as @blacklist" do
        Blacklist.stub(:new).with({'these' => 'params'}) { mock_blacklist(:save => false) }
        post :create, :blacklist => {'these' => 'params'}
        assigns(:blacklist).should be(mock_blacklist)
      end

      it "re-renders the 'new' template" do
        Blacklist.stub(:new) { mock_blacklist(:save => false) }
        post :create, :blacklist => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested blacklist" do
        Blacklist.should_receive(:find).with("37") { mock_blacklist }
        mock_blacklist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :blacklist => {'these' => 'params'}
      end

      it "assigns the requested blacklist as @blacklist" do
        Blacklist.stub(:find) { mock_blacklist(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:blacklist).should be(mock_blacklist)
      end

      it "redirects to the blacklist" do
        Blacklist.stub(:find) { mock_blacklist(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(blacklist_url(mock_blacklist))
      end
    end

    describe "with invalid params" do
      it "assigns the blacklist as @blacklist" do
        Blacklist.stub(:find) { mock_blacklist(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:blacklist).should be(mock_blacklist)
      end

      it "re-renders the 'edit' template" do
        Blacklist.stub(:find) { mock_blacklist(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested blacklist" do
      Blacklist.should_receive(:find).with("37") { mock_blacklist }
      mock_blacklist.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the blacklists list" do
      Blacklist.stub(:find) { mock_blacklist }
      delete :destroy, :id => "1"
      response.should redirect_to(blacklists_url)
    end
  end

end

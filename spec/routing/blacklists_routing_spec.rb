require "spec_helper"

describe BlacklistsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/blacklists" }.should route_to(:controller => "blacklists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/blacklists/new" }.should route_to(:controller => "blacklists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/blacklists/1" }.should route_to(:controller => "blacklists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/blacklists/1/edit" }.should route_to(:controller => "blacklists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/blacklists" }.should route_to(:controller => "blacklists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/blacklists/1" }.should route_to(:controller => "blacklists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/blacklists/1" }.should route_to(:controller => "blacklists", :action => "destroy", :id => "1")
    end

  end
end

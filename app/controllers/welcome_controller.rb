# encoding: utf-8
class WelcomeController < ApplicationController

  caches_page :index
    
  def index
    render :layout => false
  end

end

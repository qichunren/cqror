# encoding: utf-8
class PagesController < ApplicationController
  layout false
  def contact
  end 
  
  def about_me
    render :layout =>  "myblog"
  end

end

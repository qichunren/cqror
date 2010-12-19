# encoding: utf-8
class PagesController < ApplicationController
  layout false
  def contact
  end 
  
  def about_me
    render :layout =>  "myblog"
  end
  
  def code_image
    image = NoisyImage.new(4)
    session[:code] = image.code
    send_data image.code_image, :type => 'image/jpeg', :disposition => 'inline'
  end
  

end

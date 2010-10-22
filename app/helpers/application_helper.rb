# coding: utf-8
module ApplicationHelper

  def show_flash_messages
    [:notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
    end.join
  end

  #set the title for the page
  def title(page_title)
    content_for(:title) do 
      "#{page_title} - 蕲春人的博客"
    end
  end 

  #set the description for the page
  def description(page_description)
    content_for(:description) do 
      "<meta name=\"description\" content=\"#{page_description}\" />\n"
    end
  end

   #set the keywords for the page
   def keywords(page_keywords)
     content_for(:keywords) do 
       "<meta name=\"keywords\"  content=\"#{page_keywords}\" />\n"
     end     
   end

   def is_admin?
     current_user && current_user.login == "admin" && current_user.email == "whyruby@gmail.com"
   end

   def logged_in?
     !!current_user
   end

  def google_analytics
    render "/shared/google_analytics"
  end
end

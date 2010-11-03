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
   
   def coderay(text)     
     text.gsub!(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do    
       content_tag("notextile", raw(CodeRay.scan($3, $2).div(:css => :class)) )
     end
     raw text                                              
   end
   
   def format_post(text)
      #raw RedCloth.new(text).to_html
      raw textilize(coderay(text))
   end    
   
   def wikitoolbar_for(field_id)
     # Is there a simple way to link to a public resource?
     url = "help/wiki_syntax.html"
     
     help_link = "Help" + ': ' +
       link_to("Help", url,
               :onclick => "window.open(\"#{ url }\", \"\", \"resizable=yes, location=no, width=300, height=640, menubar=no, status=no, scrollbars=yes\"); return false;")
 
     javascript_include_tag('jstoolbar/jstoolbar.js') +
       javascript_include_tag('jstoolbar/textile.js') +
       javascript_include_tag("jstoolbar/lang/jstoolbar-zh.js") +
     javascript_tag("var wikiToolbar = new jsToolBar(document.getElementById('#{field_id}')); wikiToolbar.setHelpLink('#{help_link}'); wikiToolbar.draw();")
   end
   

  def google_analytics
    render "/shared/google_analytics"
  end
end

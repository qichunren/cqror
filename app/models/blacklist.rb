class Blacklist < ActiveRecord::Base 
  
  
  def self.is_black?(request)
    find(:all).collect {|list| list.ip }.include? request.remote_ip
  end
  
end

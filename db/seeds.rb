# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#Post.delete(:all)
#Posto.all.each do |old_post|
# post = Post.new
# post.title = old_post.title
# post.content = old_post.body
# post.save!
#end


User.create!(:login => "admin", :email => "whyruby@gmail.com", :password => "admin", 
               :password_confirmation => "admin") if User.find_by_login('admin').blank?


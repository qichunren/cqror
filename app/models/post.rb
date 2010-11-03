class Post < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true
  acts_as_taggable  
  
  has_many :comments

  scope :normal, where(:published => true) 
  scope :draft,  where(:published => false)
  
  before_create do |post|
    post.click_count = 0
  end

end

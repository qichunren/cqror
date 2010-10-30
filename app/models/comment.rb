class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates :content, :presence => true
  
  scope :latest, :order => "id DESC"
  
  include Gravtastic
  gravtastic
  
end

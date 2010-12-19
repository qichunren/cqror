class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates :content, :presence => true
  validates :author,  :presence => true
  validates :email,   :presence => true
  
  scope :latest, :order => "id DESC"
  
  include Gravtastic
  gravtastic
  
end

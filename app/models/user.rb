# encoding: utf-8
class User < ActiveRecord::Base

  validates :login, :presence => true, :uniqueness => true

  acts_as_authentic do |c|
  end

  before_create do |admin|
    admin.role = 0
  end
  
  # use current user in model layer
  def self.current
    Thread.current[:user]
  end
  
  # set current user in model layer
  def self.current=(user)
    Thread.current[:user] = user
  end

  
end

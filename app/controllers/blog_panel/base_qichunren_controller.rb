# encoding: utf-8
class BlogPanel::BaseQichunrenController < ApplicationController
  before_filter :require_user
  layout "blog_panel"
  
end
class Post < ActiveRecord::Base
  CATEGORY = { "未分类" => 0, "软件开发" => 1, "生活感想" => 2, "杂七杂八" => 8 }

  named_scope :recent, lambda { |limit|{ :limit => limit, :order => "created_at DESC"} }

  has_many :post_comments, :order => "created_at"

  def category_name
    CATEGORY.invert.fetch(category_id)
  end

  def self.get_category_name_by_id(category_id)
    CATEGORY.invert.fetch(category_id)
  end
end

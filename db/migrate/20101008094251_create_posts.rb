class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.integer :click_count
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :email
      t.string :author
      t.string :website
      t.text :content
      t.string :user_ip
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

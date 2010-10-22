class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string   "login",                   :limit => 200,                                 :null => false
      t.string   "email",                   :limit => 200
      t.string   "crypted_password",        :limit => 200,                                  :null => false
      t.string   "password_salt",           :limit => 200,                                  :null => false
      
      t.string   "persistence_token",       :limit => 200,                                  :null => false
      t.string   "single_access_token",     :limit => 200,                                  :null => false
      
      t.integer   "role",        :limit => 2,                                               :null => false
      
      t.datetime  "last_login_at"
      t.string    "last_login_ip"
      
      t.datetime "last_change_at"
      t.integer  "login_count",               :default => 1
      
      t.timestamps
    end
    
    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_login_at
  end

  def self.down
    remove_index :users, :login
    remove_index :users, :persistence_token
    remove_index :users, :last_login_at
    
    drop_table "users"
  end
end

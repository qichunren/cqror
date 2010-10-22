class Posto < ActiveRecord::Base
  establish_connection :developments

  set_table_name "posts"
end

class DelColumnUid < ActiveRecord::Migration
  def change
     remove_column :users, :user_id_id
  end
end

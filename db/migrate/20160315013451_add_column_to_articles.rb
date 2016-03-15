class AddColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :username, :references
  end
end
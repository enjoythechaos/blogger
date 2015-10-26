class AddViewsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :views, :integer, :null => false, :default => 0
  end
end

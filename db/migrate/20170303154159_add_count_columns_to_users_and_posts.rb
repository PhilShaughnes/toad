class AddCountColumnsToUsersAndPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :post_count, :integer, :default => 0
    add_column :users, :mentioners_count, :integer, :default => 0
    add_column :users, :mentionees_count, :integer, :default => 0
    add_column :users, :followers_count, :integer, :default => 0
    add_column :users, :followees_count, :integer, :default => 0
    add_column :users, :likees_count, :integer, :default => 0
    add_column :posts, :likers_count, :integer, :default => 0
  end
end

class AddAndDeleteColumnsFromUsersAndPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :post_count, :integer, :default => 0
    add_column :users, :posts_count, :integer, :default => 0

    remove_column :users, :mentionees_count, :integer, :default => 0
    add_column :posts, :mentionees_count, :integer, :default => 0

  end
end

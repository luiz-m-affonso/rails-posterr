class AddFollowersForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :followers_count, :integer, default: 0
  end
end

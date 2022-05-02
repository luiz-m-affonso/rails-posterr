class AddFollowingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :following, :string
  end
end

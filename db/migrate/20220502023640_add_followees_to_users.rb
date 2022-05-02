class AddFolloweesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :followees_count, :integer, default: 0
  end
end

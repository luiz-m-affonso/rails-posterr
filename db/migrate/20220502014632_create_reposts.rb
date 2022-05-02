class CreateReposts < ActiveRecord::Migration[6.1]
  def change
    create_table :reposts do |t|
      t.string :title
      t.string :description
      t.string :text
      t.string :type

      t.timestamps
    end
  end
end

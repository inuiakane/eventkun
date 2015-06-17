class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.integer :event_id
      t.string :user_name
      t.integer :attendance
      t.text :body

      t.timestamps
    end
  end
end

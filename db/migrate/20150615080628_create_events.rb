class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :info
      t.datetime :start_at
      t.datetime :end_at
      t.string :key

      t.timestamps
    end
  end
end
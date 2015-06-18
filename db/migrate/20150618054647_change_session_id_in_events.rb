class ChangeSessionIdInEvents < ActiveRecord::Migration
  def change
    change_column :events, :session_id, :string
  end
end

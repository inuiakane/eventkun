class ChangeSessionIdInAttends < ActiveRecord::Migration
  def change
    change_column :attends, :session_id, :string
  end
end

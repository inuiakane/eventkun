class AddSessionIdToAttends < ActiveRecord::Migration
  def change
    add_column :attends, :session_id, :integer
  end
end

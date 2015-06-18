class AddSessionIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :session_id, :integer
  end
end

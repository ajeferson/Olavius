class NotificationsAddTarget < ActiveRecord::Migration
  def change
    add_column :notifications, :target_id, :integer, index: true
  end
  add_foreign_key :notifications, :users, column: :target_id, primary_key: :id
end

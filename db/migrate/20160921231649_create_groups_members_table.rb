class CreateGroupsMembersTable < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end

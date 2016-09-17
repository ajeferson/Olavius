class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :inviting, index: true, foreign_key: true
      t.references :invitee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user_a, index: true, foreign_key: true
      t.references :user_b, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

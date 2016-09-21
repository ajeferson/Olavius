class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :owner, index: true, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

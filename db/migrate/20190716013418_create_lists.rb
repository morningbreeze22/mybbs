class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :userid
      t.string :phone
      t.string :role

      t.timestamps
    end
  end
end

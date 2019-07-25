class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :poster
      t.text :body
      t.integer :liked
      t.references :article, foreign_key: true
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end

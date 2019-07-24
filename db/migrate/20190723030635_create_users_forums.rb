class CreateUsersForums < ActiveRecord::Migration[5.2]
  def change
    create_table :users_forums, id:false do |t|
      t.belongs_to :user, index:true
      t.belongs_to :forum, index:true
    end
  end
end



class AddClicksToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :clicks, :integer
  end
end

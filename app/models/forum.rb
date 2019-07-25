class Forum < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => "users_forums"
  has_many :articles, dependent: :destroy
end

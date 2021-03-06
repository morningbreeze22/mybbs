class Article < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :replies,dependent: :destroy

  validates :title, presence: true, length: {maximum: 50},
            uniqueness: { case_sensitive: false }
end

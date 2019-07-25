class Reply < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true, length: {maximum: 255, message: "回帖不能太长，请控制在255字以内"}
end

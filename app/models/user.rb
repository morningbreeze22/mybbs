class User < ApplicationRecord
  rolify
  has_one :list
  validates :username, presence: true, length: {maximum: 255},
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  attr_writer :login

    def admin?
    self.role == "admin"
  end

  def login
    @login || self.username || self.email
  end


  def self.find_for_database_authentication(allow_conditions)
    conditions = allow_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end


end

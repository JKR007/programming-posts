class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  validates :first_name, :last_name, :email, presence: true
end

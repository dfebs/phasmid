class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships, dependent: :destroy, inverse_of: "member"
  has_many :bugs, dependent: :destroy, inverse_of: "author"

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end

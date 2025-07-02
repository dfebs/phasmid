class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :projects, dependent: :destroy, inverse_of: "owner"
  has_many :bugs, dependent: :destroy, inverse_of: "author"

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end

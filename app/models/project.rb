class Project < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, class_name: "User"
  has_many :bugs

  def owner
    memberships.find_by(role: "owner")&.member
  end
end

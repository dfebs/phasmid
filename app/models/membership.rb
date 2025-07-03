class Membership < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :project

  validates :member, presence: true
  validates :project, presence: true
  validates :role, presence: true
end

class Tag < ApplicationRecord
  belongs_to :project
  has_many :bug_tags, dependent: :destroy
  has_many :bugs, through: :bug_tags
end

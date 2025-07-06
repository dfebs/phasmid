class Tag < ApplicationRecord
  belongs_to :project
  has_many :bugs, through: :bug_tags
end

class Bug < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :project
  has_rich_text :description
  has_many :bug_tags, dependent: :destroy
  has_many :tags, through: :bug_tags, dependent: :destroy

  after_create_commit -> { broadcast_prepend_to "bugs", partial: "bugs/bug", locals: { bug: self, project: self.project }, target: "bugs" }
end

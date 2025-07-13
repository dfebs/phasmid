class Bug < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :project
  has_rich_text :description
  has_many :bug_tags, dependent: :destroy
  has_many :tags, through: :bug_tags, dependent: :destroy

  after_create_commit -> { broadcast_prepend_to "project_bugs_sub_#{self.project.id}", partial: "bugs/bug", locals: { bug: self, project: self.project, type: "main" }, target: "bugs" }
end

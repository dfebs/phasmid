class Bug < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :project
  has_rich_text :description

  after_create_commit -> { broadcast_prepend_to "bugs", partial: "bugs/bug", locals: { bug: self }, target: "bugs" }
end

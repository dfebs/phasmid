class Bug < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :project
  has_rich_text :description
end

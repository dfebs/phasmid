class BugTag < ApplicationRecord
  belongs_to :bug
  belongs_to :tag
end

class Project < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, class_name: "User"
  has_many :bugs, dependent: :destroy
  has_many :tags, dependent: :destroy

  after_create_commit :create_default_tags

  def owner
    memberships.find_by(role: "owner")&.member
  end

  def create_default_tags
    Constants::DEFAULT_TAGS.each do |tag_params|
      tag = Tag.new(tag_params)
      tag.project_id = self.id
      tag.save!
    end
  end
end

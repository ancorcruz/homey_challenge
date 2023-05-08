class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :trackable, polymorphic: true

  validates :project, :trackable, presence: true
end

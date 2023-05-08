class Comment < ApplicationRecord
  belongs_to :project
  has_one :activity, as: :trackable

  validates :project, :body, presence: true
end

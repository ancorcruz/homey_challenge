class Comment < ApplicationRecord
  belongs_to :project

  validates :project, :body, presence: true
end

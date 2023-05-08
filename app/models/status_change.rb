class StatusChange < ApplicationRecord
  belongs_to :project

  validates :project, :previous_status, :new_status, presence: true
  validates :previous_status, comparison: {other_than: :new_status}
end

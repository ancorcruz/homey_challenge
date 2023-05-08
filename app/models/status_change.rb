class StatusChange < ApplicationRecord
  belongs_to :project

  has_one :activity, as: :trackable

  validates :project, :previous_status, :new_status, presence: true
  validates :previous_status, comparison: {other_than: :new_status}
end

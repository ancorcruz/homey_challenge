class Project < ApplicationRecord
  STATUSES = [
    :in_progress,
    :completed,
    :cancelled
  ].freeze

  enum status: STATUSES.map { |e| [e, e.to_s] }.to_h.freeze

  has_many :activities, -> { order(created_at: :desc) }
  has_many :comments
  has_many :status_changes

  validates :name, :status, presence: true
end

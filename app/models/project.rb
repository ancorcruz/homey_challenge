class Project < ApplicationRecord
  STATUSES = [
    :in_progress,
    :completed,
    :cancelled
  ].freeze

  enum status: STATUSES.map { |e| [e, e.to_s] }.to_h.freeze

  has_many :activities, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  validates :name, :status, presence: true
end

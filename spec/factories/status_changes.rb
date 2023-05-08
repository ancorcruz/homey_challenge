FactoryBot.define do
  factory :status_change do
    project
    previous_status { "in_progress" }
    new_status { "completed" }
  end
end

FactoryBot.define do
  factory :comment do
    project
    body { "beautiful comment here!" }
  end
end

FactoryGirl.define do
  factory :item do
    rank 1
    sequence(:task, 10) { |n| "To-do Item #{n}" }
    completed false
  end
end

FactoryGirl.define do
  factory :user do
    username "vanwykjd"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    unconfirmed_email false
    confirmed_at Time.now
    after(:create) { |user| user.confirm_token = nil }
    after(:create) { |user| user.confirm_digest = nil }
    after(:create) { |user| EncryptPassword.call(user: user) }
  end
end

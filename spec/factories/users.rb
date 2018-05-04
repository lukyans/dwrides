FactoryBot.define do
  sequence(:email) {|n| "user#{n}@example.com"}
  factory :user do
    first_name "Bob"
    last_name "Robbinson"
    password "password1"
    password_confirmation {|u| u.password }
    email { FactoryBot.generate(:email) }
  end
end

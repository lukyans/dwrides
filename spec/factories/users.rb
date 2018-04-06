FactoryBot.define do
  sequence(:email) {|n| "person#{n}@example.com" }
  factory :user do
    first_name "Bob"
    last_name "Robbinson"
    password "testing"
    password_confirmation {|u| u.password }
    email { FactoryBot.generate(:email) }
  end
end

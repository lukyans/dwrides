FactoryBot.define do
  factory :user do
    email {FactoryBot.generate :email}
    login {FactoryBot.generate :login}
    password "abc"
    first_name "Bob"
    last_name "Bobson"
  end
end

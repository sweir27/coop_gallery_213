# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    biography "biography"
    password "foobar"
    password_confirmation "foobar"
  end
end

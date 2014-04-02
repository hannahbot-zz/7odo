# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    email "douglas@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end

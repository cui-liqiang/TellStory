FactoryGirl.define do
  factory :user do
    email 'name@mail.com'
    display_name 'name'
    password 'password'
    password_confirmation 'password'
  end
end
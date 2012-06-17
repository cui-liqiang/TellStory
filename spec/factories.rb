FactoryGirl.define do
  factory :user do
    email 'name@mail.com'
    display_name 'name'
    password 'password'
    password_confirmation 'password'
  end

  factory :sina_user do
    sina_id 'sina id'
    display_name 'liqiang'
    head 'head/link'
  end
end

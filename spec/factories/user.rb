FactoryGirl.define do

  factory :user do
    email 'raph@test.com'
    password '12345'
    password_confirmation '12345'
    name 'Raph'
  end
end
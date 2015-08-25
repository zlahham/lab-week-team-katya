require 'factory_girl'

FactoryGirl.define do

  factory :task do
    task 'Wash my hair'
    location 'Home'
    deadline '26/08/2015'
  end

  # factory :tasks do
  #   task 'Wash my hair'
  #   location 'Home'
  #   deadline '26/08/2015'
  #   tags 'Personal'
  # end

end
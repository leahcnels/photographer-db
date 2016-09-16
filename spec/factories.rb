FactoryGirl.define do
  factory :user do
    name 'Leah'
    email 'leahcnels@gmail.com'
    password 'password'
    phone '555-555-5555'
    address '123 Main St'
  end

  factory :category do
    name 'Stuff'
  end
end

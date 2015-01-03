require 'factory_girl'

FactoryGirl.define do
  factory :manufacturer do
    name "Tonka"
    country "USA"
  end

  factory :car do
    manufacturer "Toyota"
    color 'Black'
    year '1999'
    mileage '100000'
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory_item do
    title "Shrimp"
    description "This is really good for a pasta!"
    quantity 3
  end
end

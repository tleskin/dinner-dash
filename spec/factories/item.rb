FactoryGirl.define do


  factory :item do
    title
    description 
    price        5
  end

  sequence :title do |n|
    "Item#{n}"
  end

  sequence :description do |n|
    "Item Description#{n}"
  end

end

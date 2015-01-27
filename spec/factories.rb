FactoryGirl.define do
  sequence :name do |n|
    "Name-#{n}"
  end 

  factory :contestant do
    name
    weight  180
    height  72
  end

  factory :trainer do
    gender "female"
    weight  140
    height  65
  end

end

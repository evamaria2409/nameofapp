FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    name "Generated shoe"
    image_url "https://www.gimp.org/tutorials/Blur_Overlays/before.jpg"
    price "25.99"
    id 
  end
end
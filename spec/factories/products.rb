FactoryGirl.define do
  factory :product do |f|
    f.title "Lorem Ipsum Factory Testing"
    f.description "Test your application using ancient latin supported by steam engines"
    f.image_url "lorem.png"
    f.price 45
  end
end

FactoryGirl.define do

  factory :user do
    name                  "John"
    password              "Secret"
    password_confirmation "Secret"
  end

  factory :order do
    name            "Dave Thomas"
    address         "Dave Thomas Address"
    email           "dave@dave.com"
    pay_type        "Check"
  end

  factory :product do
    product_id      "Ruby"
    title           "Programming Ruby 1.9"
    description     "Ruby is the fastest growing and most exciting dynamic
                    language out there. If you need to get working programs
                    delivered fast, you should add Ruby to your toolbox."
    price           49.50
    image_url       "ruby.png"
  end

  factory :line_item do
    cart_id       
    product_id
  end
end

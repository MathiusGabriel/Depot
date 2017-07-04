FactoryGirl.define do
  factory :order do |f|
    f.name "Buyer One"
    f.adress "Paranoia Street 12"
    f.email "buyer1@paranoia.com"
    f.pay_type "Check"
  end
end

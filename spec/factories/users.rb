FactoryGirl.define do
  factory :user do
  	password "12345678"
  	sequence(:email){|n| "dummy_#{n}@factory.com"}
  	sequence(:username){|n| "username#{n}"}
    
  end
end

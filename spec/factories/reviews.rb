FactoryGirl.define do
  factory :review do
    association :user #create new user on the fly
    rating {Faker::Number.between(1,5)}
    sequence(:comment) {|n| "Test review number #{n}"}
  end

end

FactoryGirl.define do
	trait :user_trait do
	  password "foobar123"
	  password_confirmation "foobar123"
	  first_name "Example"
	  last_name "User"
	  association :company, factory: :company
	  confirmed_at          Time.now
	end

	factory :user, traits: [:user_trait] do
	  sequence(:id) { |n| "#{n}" }
	  sequence(:email) { |n| "user-#{n}@example.ox.ac.uk" }
	end

	factory :company do
		sequence(:id) { |n| "#{n}" }
		name "Example Company"
		address "Example Address"
		url "http://example.com"
	end

	factory :project do
		name "Example project"
		url "www.example.com"
		association :creator, factory: :user
	end

	factory :perferance do
		duration 1300.00
		association :user, factory: :user
	end
end

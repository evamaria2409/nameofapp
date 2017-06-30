FactoryGirl.define do

  sequence "email" do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email 
    password "1234567890"
    first_name "Peter"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
  	email
	password "qwertyuiop"
	admin true
	first_name "Admin"
	last_name "User"
  end

end
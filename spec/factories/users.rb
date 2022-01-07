FactoryBot.define do
  factory :user do
    # name {Faker::Name.name}
    email {Faker::Internet.email}
    # email {"nishan@gmail.com"}

    password {Faker::Internet.password}
  end
end

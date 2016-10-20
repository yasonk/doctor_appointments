FactoryGirl.define do
  factory :doctor do

    transient do
      ailment { create(:ailment, name: 'heart disease') }
    end

    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    street { Faker::Address.street_address }
    city 'New York'
    state 'NY'
    zip '10012'

    specialty { association(:specialty, ailment: ailment) }

    after :create do |doctor|
      doctor.specialty.save!
    end
  end
end

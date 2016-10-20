FactoryGirl.define do
  factory :appointment do
    transient do
      ailment { create(:ailment, name: 'heart disease') }
    end
    doctor { association(:doctor, ailment: ailment) }
    patient { association(:patient, ailment: ailment) }

    date { Faker::Time.between(4.days.from_now, 5.days.from_now) }

    after :create do |appointment|
      appointment.doctor.save!
      appointment.patient.save!
    end
  end
end

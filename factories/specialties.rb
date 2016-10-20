FactoryGirl.define do
  factory :specialty do
    transient do
      ailment { create(:ailment, name: 'heart disease') }
    end
    name { 'Cardiologist' }

    after :build do |specialty, evaluator|
      specialty.ailments << evaluator.ailment
    end
  end
end

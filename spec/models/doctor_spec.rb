require 'rails_helper'
require 'support/person_examples'

describe Doctor do
  subject(:doctor) { build :doctor }

  it { is_expected.to be_valid }

  it_behaves_like 'a person'

  describe '#name' do
    let(:name) { subject.name }

    it 'starts with "Dr. "' do
      expect(name.starts_with?('Dr. ')).to be_truthy
    end
  end

  context 'when doctor does not have specialty' do
    subject { build(:doctor, specialty: nil) }
    it { is_expected.not_to be_valid }
  end

  describe "#can_treat" do
    context "when doctor specialty can treat the ailment" do
      let(:ailment) { doctor.specialty.ailments.first }

      it 'should return true' do
        expect(doctor.can_treat(ailment)).to eq true
      end
    end

    context 'when doctor specialty cannot treat the ailment' do
      let(:ailment) { create(:ailment, name:'not treatable') }

      it 'should return false' do
        expect(doctor.can_treat(ailment)).to eq false
      end
    end
  end

  describe "#destroy" do
    let!(:appointment) { create :appointment }
    it 'should destroy appointments' do
      expect { appointment.doctor.destroy! }.to change {Appointment.count}.by(-1)
    end
  end
end

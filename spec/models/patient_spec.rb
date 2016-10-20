require 'rails_helper'
require 'support/person_examples'

describe Patient do
  subject { create :patient }

  it { is_expected.to be_valid }

  it_behaves_like 'a person'

  describe "#destroy" do
    let!(:appointment) { create :appointment }
    it 'should destroy appointments' do
      expect { appointment.patient.destroy! }.to change {Appointment.count}.by(-1)
    end
  end
end

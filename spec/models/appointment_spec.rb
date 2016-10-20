require 'rails_helper'

describe Appointment do
  subject(:appointment) { build :appointment }

  it { is_expected.to be_valid }

  context 'when distance between patient and doctor addresses is too high' do
    before do
      allow(Geocoder::Calculations).to receive(:distance_between).and_return(Appointment::MAX_APPOINTMENT_DISTANCE + 1)
    end
    it { is_expected.not_to be_valid }
  end

  context 'when patient does not exist' do
    let(:doctor) { create :doctor }
    subject(:appointment) { build :appointment, patient_id: 100, doctor: doctor }
    it { is_expected.not_to be_valid }
  end

  context 'when doctor does not exist' do
    let(:patient) { create :patient }
    subject(:appointment) { build :appointment, patient: patient, doctor_id: 100 }
    it { is_expected.not_to be_valid }
  end

  context 'when date is closer than minimum allowed' do
    subject(:appointment) { build :appointment, date: Appointment::MIN_DAYS_IN_FUTURE.days.from_now}
    it { is_expected.not_to be_valid }
  end

  context 'when doctor specialty does not match patient ailment' do
    let(:patient) { create(:patient, ailment: create(:ailment, name: 'untreatable')) }
    subject(:appointment) { build :appointment, patient: patient }
    it { is_expected.not_to be_valid }
  end

  it 'sends email to patient and doctor emails' do
    expect(AppointmentMailer).to receive(:appointment_email).with(appointment.patient.email, appointment).and_call_original
    expect(AppointmentMailer).to receive(:appointment_email).with(appointment.doctor.email, appointment).and_call_original
    appointment.save!
  end


end

require "rails_helper"

RSpec.describe AppointmentMailer, type: :mailer do
  describe '#appointment_email' do
    let(:appointment) { build :appointment }
    let(:email) { described_class.appointment_email(Faker::Internet.email, appointment).deliver_now }

    it 'should contain patient name' do
      expect(email.body.encoded).to match(appointment.patient.name)
    end

    it 'should contain doctor name' do
      expect(email.body.encoded).to match(appointment.doctor.name)
    end

    it 'should contain doctor name' do
      expect(email.body.encoded).to match(appointment.date.to_s)
    end

    it 'should contain doctor name' do
      expect(email.body.encoded).to match(appointment.doctor.address)
    end

  end
end

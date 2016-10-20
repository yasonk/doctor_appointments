class AppointmentMailer < ApplicationMailer
  def appointment_email(address_to, appointment)
    @appointment = appointment
    mail(to: address_to, subject: 'Appointment Scheduled')
  end
end

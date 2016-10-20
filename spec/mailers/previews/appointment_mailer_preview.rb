# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  def appointment_mail_preview
    AppointmentMailer.appointment_email('preview@sample.com', Appointment.first)
  end
end

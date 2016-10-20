class Appointment < ActiveRecord::Base

  MAX_APPOINTMENT_DISTANCE = 10
  MIN_DAYS_IN_FUTURE       = 3

  belongs_to :doctor
  belongs_to :patient

  after_create :send_notifications

  validates :doctor, presence: true
  validates_presence_of :patient
  validate :doctor_within_x_miles_from_patient, :doctor_can_treat_patient, :date_x_days_in_future

  def doctor_within_x_miles_from_patient
    return if doctor.blank? || patient.blank?
    if Geocoder::Calculations.distance_between(doctor.address, patient.address) > MAX_APPOINTMENT_DISTANCE
      errors.add(:doctor, "must be within #{MAX_APPOINTMENT_DISTANCE} miles")
    end
  end

  def date_x_days_in_future
    return if date.blank?
    if date < MIN_DAYS_IN_FUTURE.days.from_now
      errors.add(:date, "must be at least #{MIN_DAYS_IN_FUTURE} days in the future")
    end
  end

  def send_notifications
    AppointmentMailer.appointment_email(doctor.email, self).deliver_now
    AppointmentMailer.appointment_email(patient.email, self).deliver_now
  end

  def doctor_can_treat_patient
    return if self.doctor.blank? || self.patient.blank?
    unless self.doctor.can_treat(self.patient.ailment)
      errors.add(:doctor, 'must be able to treat patient')
    end
  end
end


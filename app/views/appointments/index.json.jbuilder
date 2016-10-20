json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :doctor_id, :patient_id, :date
  json.url appointment_url(appointment, format: :json)
end

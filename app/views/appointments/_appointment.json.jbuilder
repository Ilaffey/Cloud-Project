json.extract! appointment, :id, :user_id, :doctorprofile_id, :patient_id, :notes, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

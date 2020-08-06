json.extract! patient, :id, :name, :contactNumber, :address, :gender, :dob, :ppsNumber, :created_at, :updated_at
json.url patient_url(patient, format: :json)

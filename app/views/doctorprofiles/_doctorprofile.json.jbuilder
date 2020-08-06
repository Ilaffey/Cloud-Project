json.extract! doctorprofile, :id, :name, :contactNumber, :address, :user_id, :created_at, :updated_at
json.url doctorprofile_url(doctorprofile, format: :json)

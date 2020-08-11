class Appointment < ApplicationRecord
# Validate to ensure our current user does not have a conflicting appointment
validates :date, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :doctorprofile
  belongs_to :patient


  
end

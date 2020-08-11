class Patient < ApplicationRecord
has_many :appointments
validates :name, presence: true
validates :address, length: { maximum: 200 }
validates :contactNumber, numericality: { only_integer: true}

def self.search(search)
 where("name LIKE ?", "%#{search}%") 
end
end

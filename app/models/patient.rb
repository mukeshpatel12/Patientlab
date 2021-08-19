class Patient < ApplicationRecord
	has_many :patient_labs, dependent: :destroy
	validates_presence_of :id_number
end

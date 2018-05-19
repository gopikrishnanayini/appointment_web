class Appointment < ApplicationRecord
	has_many :patients, inverse_of: :appointment, dependent: :destroy
end

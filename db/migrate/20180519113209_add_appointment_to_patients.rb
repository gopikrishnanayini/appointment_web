class AddAppointmentToPatients < ActiveRecord::Migration[5.1]
  def change
    add_reference :patients, :appointment, foreign_key: true
  end
end

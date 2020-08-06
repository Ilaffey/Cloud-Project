class CreateDoctorprofiles < ActiveRecord::Migration[5.2]
  def change
    create_table :doctorprofiles do |t|
      t.string :name
      t.integer :contactNumber
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

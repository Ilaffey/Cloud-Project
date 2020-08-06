class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :contactNumber
      t.string :address
      t.string :gender
      t.string :dob
      t.string :ppsNumber
      

      t.timestamps
    end
  end
end

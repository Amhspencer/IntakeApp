class AddMedicalFacilityToForm < ActiveRecord::Migration
  def change
    add_column :forms, :medical_facility, :string
  end
end

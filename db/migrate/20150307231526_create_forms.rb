class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.datetime :date_of_birth
      t.integer :phone_number
      t.string :preferred_language
      t.string :cancer_care_provider
      t.string :service_area
      t.boolean :surgery
      t.boolean :chemo
      t.boolean :radiation
      t.boolean :late_stage
      t.string :income
      t.boolean :additional_info
      t.boolean :consent
      t.string :signature
      t.datetime :date

      t.timestamps
    end
  end
end

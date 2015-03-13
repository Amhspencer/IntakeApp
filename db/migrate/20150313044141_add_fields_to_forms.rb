class AddFieldsToForms < ActiveRecord::Migration
  def change
    add_column :forms, :processed, :boolean
  end
end

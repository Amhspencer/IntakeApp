class AddUserNameToForms < ActiveRecord::Migration
  def change
    add_column :forms, :user_name, :string
  end
end

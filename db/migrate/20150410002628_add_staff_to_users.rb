class AddStaffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    remove_column :users, :admin
  end
end

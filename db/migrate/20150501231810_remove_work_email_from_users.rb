class RemoveWorkEmailFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :work_email
  end

  def down
    add_column :users, :work_email, :string
  end
end

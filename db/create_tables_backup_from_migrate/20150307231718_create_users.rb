class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :work_email
      t.string :password
      t.integer :phone_number

      t.timestamps
    end
  end
end

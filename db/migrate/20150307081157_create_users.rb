class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      #t.timestamps
      t.timestamps null: false
      # use this line to automatically create 2 columns: created_at and updated_at
    end
  end
end

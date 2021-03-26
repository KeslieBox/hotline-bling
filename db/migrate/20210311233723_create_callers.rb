class CreateCallers < ActiveRecord::Migration[6.1]
  def change
    create_table :callers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end

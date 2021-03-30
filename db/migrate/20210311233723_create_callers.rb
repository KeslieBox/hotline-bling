class CreateCallers < ActiveRecord::Migration[6.1]
  def change
    create_table :callers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :phone_number2
      t.string :address
      t.string :city
      t.string :zipcode
      t.belongs_to :state
      t.belongs_to :parish

      t.timestamps
    end
  end
end

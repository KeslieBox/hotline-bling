class CreateParishes < ActiveRecord::Migration[6.1]
  def change
    create_table :parishes do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateCalls < ActiveRecord::Migration[6.1]
  def change
    create_table :calls do |t|
      t.date :date
      t.text :dispatch_log
      t.belongs_to :dispatcher
      t.belongs_to :caller

      t.timestamps
    end
  end
end

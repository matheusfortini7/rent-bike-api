class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.string :start_date
      t.string :end_date
      t.float :value
      t.string :local

      t.timestamps
    end
  end
end

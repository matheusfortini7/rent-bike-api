class AddForeignKeysToRents < ActiveRecord::Migration[7.1]
  def change
    add_reference :rents, :bike, foreign_key: true
    add_reference :rents, :client, foreign_key: true
  end
end

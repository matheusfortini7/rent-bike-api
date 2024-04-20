class AddForeignKeyToBikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :bikes, :clients, foreign_key: true
  end
end

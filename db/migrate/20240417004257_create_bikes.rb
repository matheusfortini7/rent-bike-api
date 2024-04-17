class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.string :color

      t.timestamps
    end
  end
end

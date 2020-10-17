class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :other_breed
      t.integer :gender
      t.date :birthday
      t.float :weight
      t.float :length
      t.text :introduce
      t.timestamps
    end
  end
end

class CreatePetBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :pet_breeds do |t|
      t.string :name
      t.timestamps
    end
  end
end

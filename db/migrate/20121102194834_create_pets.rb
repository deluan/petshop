class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :pet_type
      t.references :client

      t.timestamps
    end
  end
end

class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :age
      t.string :description
      t.string :location
      t.string :imageUrl
      t.date :postedDate
      t.boolean :isAdopted
    end
  end
end

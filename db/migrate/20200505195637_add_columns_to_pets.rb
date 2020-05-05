class AddColumnsToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :size, :string
    add_column :pets, :spayed_neutered, :boolean
    add_column :pets, :house_trained, :boolean
    add_column :pets, :gender, :string
    add_column :pets, :colors, :string
    add_column :pets, :species, :string
  end
end

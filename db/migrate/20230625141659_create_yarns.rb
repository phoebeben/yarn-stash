class CreateYarns < ActiveRecord::Migration[7.0]
  def change
    create_table :yarns do |t|
      t.string :name
      t.string :brand
      t.string :fibre_type
      t.string :yarn_weight
      t.integer :skein_count
      t.integer :weight
      t.integer :yardage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

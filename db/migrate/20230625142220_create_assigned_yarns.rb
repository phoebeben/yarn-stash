class CreateAssignedYarns < ActiveRecord::Migration[7.0]
  def change
    create_table :assigned_yarns do |t|
      t.integer :quantity
      t.references :project, null: false, foreign_key: true
      t.references :yarn, null: false, foreign_key: true

      t.timestamps
    end
  end
end

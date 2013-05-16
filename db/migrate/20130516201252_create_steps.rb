class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :stepnum
      t.string :description
      t.references :list

      t.timestamps
    end
    add_index :steps, :list_id
  end
end

class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :label
      t.string :value
      t.string :color
      t.references :catalog

      t.timestamps
    end
    add_index :boxes, :catalog_id
  end
end

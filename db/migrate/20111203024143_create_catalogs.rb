class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.date :date
      t.string :issue
      t.references :publisher

      t.timestamps
    end
    add_index :catalogs, :publisher_id
  end
end

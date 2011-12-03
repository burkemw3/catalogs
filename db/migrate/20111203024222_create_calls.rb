class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.date :date
      t.string :result
      t.references :publisher

      t.timestamps
    end
    add_index :calls, :publisher_id
  end
end

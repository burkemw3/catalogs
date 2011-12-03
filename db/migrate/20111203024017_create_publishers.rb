class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :phone
      t.boolean :should_call
      t.string :address
      t.references :user

      t.timestamps
    end
    add_index :publishers, :user_id
  end
end

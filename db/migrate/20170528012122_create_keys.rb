class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.float :number, null: false
      t.string :keyword, null: false

      t.timestamps
    end
    add_index :keys, [:number, :keyword], :unique => true
  end
end

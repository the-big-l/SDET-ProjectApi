class CreateTargetCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :target_countries do |t|
      t.integer :project_id
      t.integer :country_id

      t.timestamps
    end
    add_index :target_countries, [:project_id, :country_id], :unique => true
  end
end

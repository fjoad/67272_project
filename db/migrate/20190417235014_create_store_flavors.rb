class CreateStoreFlavors < ActiveRecord::Migration[5.2]
  def change
    create_table :store_flavors do |t|
      t.references :Store, foreign_key: true
      t.references :Flavor, foreign_key: true

      t.timestamps
    end
  end
end

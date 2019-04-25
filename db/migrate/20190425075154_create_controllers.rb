class CreateControllers < ActiveRecord::Migration[5.2]
  def change
    create_table :controllers do |t|
      t.string :StoreFlavor
      t.references :store, foreign_key: true
      t.references :flavor, foreign_key: true

      t.timestamps
    end
  end
end

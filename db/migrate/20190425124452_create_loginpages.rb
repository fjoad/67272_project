class CreateLoginpages < ActiveRecord::Migration[5.2]
  def change
    create_table :loginpages do |t|
      t.string :index

      t.timestamps
    end
  end
end

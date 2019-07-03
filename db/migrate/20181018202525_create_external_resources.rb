class CreateExternalResources < ActiveRecord::Migration[5.1]
  def change
    create_table :external_resources do |t|
      t.string :name
      t.string :link
      t.text :description
      t.string :img
      t.integer :rank

      t.timestamps
    end
  end
end

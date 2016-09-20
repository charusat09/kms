class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :tile
      t.string :description

      t.timestamps
    end
  end
end

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :items, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end

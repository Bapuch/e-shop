class CreateTableItems < ActiveRecord::Migration[5.2]
  def change
    create_table :table_items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end

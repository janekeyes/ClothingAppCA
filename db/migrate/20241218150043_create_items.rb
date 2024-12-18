class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :size
      t.string :colour
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

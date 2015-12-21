class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :list, index: true, foreign_key: true
      t.string :description
      t.string :name
      t.boolean :completed

      t.timestamps
    end
  end
end

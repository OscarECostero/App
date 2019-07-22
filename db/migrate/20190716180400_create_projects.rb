class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.boolean :is_remote, default: false
      t.integer :price , scale: 2, precision: 8
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :days
      t.boolean :completed
      t.boolean :deleted

      t.timestamps
    end
  end
end

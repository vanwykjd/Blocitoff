class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :rank
      t.string :task
      t.boolean :completed, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

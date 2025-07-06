class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.string :color
      t.references :project, null: false, foreign_key: true
      t.string :name, null: false
      t.float :weight, null: false

      t.timestamps
    end
  end
end

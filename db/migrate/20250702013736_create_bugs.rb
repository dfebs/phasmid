class CreateBugs < ActiveRecord::Migration[8.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :project, null: false, foreign_key: true
      t.string :notes

      t.timestamps
    end
  end
end

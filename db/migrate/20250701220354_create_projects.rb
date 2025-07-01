class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

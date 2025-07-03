class CreateMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :memberships do |t|
      t.references :member, null: false, foreign_key: { to_table: :users }
      t.references :project, null: false, foreign_key: true
      t.string :role, null: false

      t.timestamps
    end
  end
end

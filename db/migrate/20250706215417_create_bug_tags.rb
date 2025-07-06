class CreateBugTags < ActiveRecord::Migration[8.0]
  def change
    create_table :bug_tags do |t|
      t.references :bug, null: false, foreign_key: { on_delete: :cascade }
      t.references :tag, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end

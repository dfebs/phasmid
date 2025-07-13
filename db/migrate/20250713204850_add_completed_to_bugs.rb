class AddCompletedToBugs < ActiveRecord::Migration[8.0]
  def change
    add_column :bugs, :completed, :boolean, null: false, default: false
  end
end

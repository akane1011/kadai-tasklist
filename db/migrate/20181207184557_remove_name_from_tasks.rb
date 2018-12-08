class RemoveNameFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :name, :string
  end
end

class AddIsDeletedToMemos < ActiveRecord::Migration[5.1]
  def change
    add_column :memos, :is_deleted, :boolean
  end
end

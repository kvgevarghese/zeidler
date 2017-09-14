class CreateMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :memos do |t|
      t.blob :country
      t.string :memo
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

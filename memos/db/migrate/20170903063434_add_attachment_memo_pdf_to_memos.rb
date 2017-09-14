class AddAttachmentMemoPdfToMemos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :memos do |t|
      t.attachment :memo_pdf
    end
  end

  def self.down
    remove_attachment :memos, :memo_pdf
  end
end

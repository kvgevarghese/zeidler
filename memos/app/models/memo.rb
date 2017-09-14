class Memo < ApplicationRecord
  mount_uploader :memo, MemoUploader
  validates_presence_of :memo

  def self.memo_list_all
    self.where(is_deleted: [false,nil])
  end
  
end

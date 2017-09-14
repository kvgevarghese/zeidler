class Document < ApplicationRecord
  mount_uploader :document, DocumentUploader
  belongs_to :memo
end

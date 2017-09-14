json.partial! "memos/memo", memo: @memo
json.extract! @memo, :id, :name, :description, :memo, :created_at, :updated_at, :country, :documents

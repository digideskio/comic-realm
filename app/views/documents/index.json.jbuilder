json.array!(@documents) do |document|
  json.extract! document, :id, :notebook_id, :title, :description
  json.url document_url(document, format: :json)
end

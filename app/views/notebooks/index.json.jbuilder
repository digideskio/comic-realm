json.array!(@notebooks) do |notebook|
  json.extract! notebook, :id, :project_id, :title, :description
  json.url notebook_url(notebook, format: :json)
end

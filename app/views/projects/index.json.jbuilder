json.array!(@projects) do |project|
  json.extract! project, :id, :Title, :Description, :user_id
  json.url project_url(project, format: :json)
end

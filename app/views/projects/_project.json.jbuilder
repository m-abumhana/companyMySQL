json.extract! project, :id, :project_domain, :description, :budget, :estimation, :created_at, :updated_at
json.url project_url(project, format: :json)

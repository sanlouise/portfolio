json.array!(@rails_projects) do |rails_project|
  json.extract! rails_project, :id, :title, :description, :points, :github, :live_link, :image
  json.url rails_project_url(rails_project, format: :json)
end

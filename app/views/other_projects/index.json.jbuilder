json.array!(@other_projects) do |other_project|
  json.extract! other_project, :id, :title, :description, :points, :github, :live_link, :image
  json.url other_project_url(other_project, format: :json)
end

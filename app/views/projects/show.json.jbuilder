json.id @project.id
json.projectName @project.project_name
json.creationDate @project.creation_date
json.expiryDate @project.expiry_date
json.enabled @project.enabled
json.targetCountries @project.countries.collect { |country| country.name }
json.projectCost @project.project_cost
json.projectUrl @project.project_url
json.targetKeys @project.keys do |key|
  json.number key.number
  json.keyword key.keyword
end

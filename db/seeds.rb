# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.destroy_all
Country.destroy_all
TargetCountry.destroy_all
Key.destroy_all
TargetKey.destroy_all

countries = {}
countries[:usa] = Country.create!(name: 'usa')
countries[:brazil] = Country.create!(name: 'brazil')
countries[:canada] = Country.create!(name: 'canada')
countries[:mexico] = Country.create!(name: 'mexico')

keys = {}
keys[:movie] = Key.create!(number: 25, keyword: 'movie')
keys[:sports] = Key.create!(number: 30, keyword: 'sports')
keys[:games] = Key.create!(number: 45, keyword: 'games')
keys[:news] = Key.create!(number: 50, keyword: 'news')

expired_project = Project.create!({
  id: 1,
  project_name: 'test project number 3',
  creation_date: '20170511 00:00:00',
  expiry_date: '20160520 00:00:00',
  enabled: true,
  project_cost: 10,
  project_url: 'http://www.unity3d.com'
})
expired_project.countries << countries.values
expired_project.keys << keys.values

disabled_project = Project.create!({
  id: 2,
  project_name: 'test project number 4',
  creation_date: '20170511 00:00:00',
  expiry_date: '20180520 00:00:00',
  enabled: false,
  project_cost: 10,
  project_url: 'http://www.unity3d.com'
})
disabled_project.countries << countries.values
disabled_project.keys << keys.values

enabled_unexpired_low_cost_project = Project.create!({
  id: 3,
  project_name: 'test project number 5',
  creation_date: '20170511 00:00:00',
  expiry_date: '20180520 00:00:00',
  enabled: true,
  project_cost: 5.5,
  project_url: 'http://www.unity3d.com'
})
enabled_unexpired_low_cost_project.countries << countries.values
enabled_unexpired_low_cost_project.keys << keys.values

enabled_unexpired_high_cost_project = Project.create!({
  id: 4,
  project_name: 'test project number 6',
  creation_date: '20170511 00:00:00',
  expiry_date: '20180520 00:00:00',
  enabled: true,
  project_cost: 9.5,
  project_url: 'http://www.unity3d.com'
})
enabled_unexpired_high_cost_project.countries << countries.values.take(3)
enabled_unexpired_high_cost_project.keys << keys.values.take(3)

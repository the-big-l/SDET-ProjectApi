## SDET Project API

This repo builds an api to create projects and then retrieve them using RESTful practices. Backend is built using Ruby on Rails which uses Rspec for testing and FactoryGirl for creating fixtures. Data is stored in a PostgreSQL db, which utilizes a binary search tree on indexes bringing time complexity of searches to O(log n).  

### Dependencies
- Ruby
- Rails
- PostgreSQL

#### Run

1. Clone repo `git clone https://github.com/the-big-l/SDET-ProjectApi.git`
2. Install gems (ruby libraries) using `bundle install`
3. Run tests: `bundle exec rspec`
4. Start server (localhost:3000): `rails s`

### Unimplemented Features
- Implement middleware to catch badly formatted json (Rails limitation)
- Additional testing of Project::find_project() method

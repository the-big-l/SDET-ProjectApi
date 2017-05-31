## SDET Project API

This repo builds an api to create projects and then retrieve them using RESTful practices. Backend is built using Ruby on Rails which uses Rspec for testing and FactoryGirl for creating fixtures. Data is stored in a PostgreSQL db, which utilizes a binary search tree on indexes bringing time complexity of searches to O(log n).  

### Dependencies
- Ruby
- Rails
- PostgreSQL

#### Run

1. Clone repo `git clone https://github.com/the-big-l/SDET-ProjectApi.git`
2. Install gems (ruby libraries) using `bundle install`
3. Run rpec tests: `bundle exec rspec`
4. Start server (localhost:3000): `rails s`
5. Seed dev db: `rake db:seed`
6. Run postman collection located in `docs` folder

### Structure

Most of the logic is contained in the `app` folder. Any requests will hit 'app/controllers/projects_controller.rb'. POST actions will hit the `create` method and GET requests will hit the `show` method. Searching for projects is implemented on the model in `app/models/project.rb`. The `Project::find_project` method conditionally searches based on parameters provied. The other models play a minor roll but are relatively simple.

Rspec tests are contained in the `spec` folder and a postman collection is stored in the `docs` folder.

Logs are stored at root in `#{environment}.log`

### Future Development
- Implement middleware to gracefully catch badly formatted json (current Rails limitation)
- Additional Rspec testing of `Project::find_project` method

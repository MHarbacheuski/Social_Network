# README

Social Network is name "Friends of interest"

* Ruby version - 3.0.1

* Database: Postgres (PostgreSQL) 13.3

Before starting the project, you need to do the following:
1. To solve dependencies and install missing gems, run:
   bundle install
2. Copy the config from database.yml.sample to database.yml
# cp config/database.yml.sample config/database.yml

3. Creates the database/Loads the schema/Seeds the database: rails db:setup
4. To start the project, use the following command in the terminal: rails s

The hardest task:
- Implement a chat between users in the system, with receiving messages in real time (without reloading the page). 

The most interesting task:
- Thought over the relationship between models that are designed for chat and implement the logic of interaction.

What could have been done if there had been more time:
- think in more detail about the strategy by which the project will be tested
- in the friends list to be able to show users online
- On the main page, display the Recent Activities tab of friends - appeared online, became
  offline, added interest, left a comment on someone's wall, etc.
- Add filters to sort friends, posts, and more.
- autocompletion with ElasticSearch
- make better ui
- add a comment without rebooting

How to log in as admin?
Write in url http://localhost:3000/admin or for prod: https://rails-social-network-01.herokuapp.com/admin
- Username: admin
- password: 765ceyz9@KK3

# Link to heroku: 
https://rails-social-network-01.herokuapp.com

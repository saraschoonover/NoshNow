# NoshNow

## Overview: A webapp for indecisive food lovers who want to make good decisions quickly.

## ERD: [Link to ERD](https://ideas.firstdraft.com/ideas/11874)

## Deployment Link: [NoshNow Deployment](https://noshnow.fly.dev/)

## Built With:
- Yelp API
- Ruby on Rails
- jQuery (AJAX)

## User Stories:
1. *As a User, I want to be able to sign in/up and out.*
2. *As a User, I want to be able to search for open restaurants in a specific city.*
3. *As a User, I want to be able to search for a food category of open restaurants.*
4. *As a User, I want to be able to see a list of restaurants that are currently open in my area.*
5. *As a User, I want to be able to narrow my search to choose a category of restaurants.*
6. *As a User, I want to be able to have a restaurant randomly chosen for me at the click of a button.*
7. *As a User, I want to click on a restaurant to see more information about that specific restaurant.*
8. *As a User, I want to be able to save a restaurant to my personal 'favorites' list.*
9. *As a User, I want to be able to delete a restaurant from my personal 'favorites' list.*

## Getting Started
Installation and usage
In development, use bundle to install all necessary gems:
```bash
bundle install
Launch a live preview with:

rails s
or

bin/dev
To populate the app with sample data for testing:

rails dev:sample_data
For resetting the development database:

rails dev:reset
Before deployment, you may want to update config.mailer_sender in devise.rb, config.action_mailer.default_url_options in production.rb, database.yml, application_mailer.rb.

##Dependencies
NoshNow is based on Ruby on Rails. The required gems are listed in the Gemfile. Additionally, accounts and API keys are needed for services like Yelp.

##Configuration
Set the necessary secret keys as environment variables. Update the mailers as required.
```

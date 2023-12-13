# NoshNow
A webapp for indecisive food lovers who want to make good decisions quickly.

## Description: 
NoshNow is your go-to app for embracing the beauty of indecision when it comes to choosing where or what to eat. I understand that sometimes deciding where to dine can be a challenging task. That's why I've created a unique experience that encourages you to lean into indecision and turn the process into a fun and spontaneous adventure with just the click of a button.

## ERD: [Link to ERD](https://ideas.firstdraft.com/ideas/11874)

## Deployment Link: [NoshNow Deployment](https://noshnow.fly.dev/)

## Built With:
- Yelp API
- Ruby on Rails
- jQuery (AJAX)

## Getting Started

### Installing

In development, use bundle to install all necessary gems:
```bash
bundle install
```
Launch a live preview with:
```bash
rails s
```
or

```bash
bin/dev
```

To populate the app with sample data for testing:

```bash
rails dev:sample_data
```

For resetting the development database:

```bash
rails dev:reset
```

Before deployment, you may want to update config.mailer_sender in devise.rb, config.action_mailer.default_url_options in production.rb, database.yml, application_mailer.rb.

## Dependencies
NoshNow is based on Ruby on Rails. The required gems are listed in the Gemfile. Additionally, accounts and API keys are needed for services like Yelp.

## Configuration
Set the necessary secret keys as environment variables. Update the mailers as required.

## Authors

Sara Schoonover

## Acknowledgements
Special thanks to the team at Discovery Partner's Institute.

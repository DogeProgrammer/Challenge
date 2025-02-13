# README

# Project overview

This application provides the ability to show a list of products (plans, devices, mobile) and its information.

# Ruby version

- 3.3.0

# Configuration

- Install ruby 3.30, you can use [rvm](https://rvm.io/rvm/install)
- Install [postgresql](https://www.postgresql.org/download/)
- On the project root directory:
  - Run `bundle install`
  - Run `yarn install`
  - Run `bin/dev` to run the project
  - Go to `localhost:3000`

# Database 

## Setup

- On the project root directory
  - Run `rails db:create`
  - Run `rails db:migrate`
  - Run `rails db:seed`

## Reset

- On the project root directory
  - Run `rails db:reset`

# How to run the test suite

- Back-end:

  - We use rspec
  - Pay attention to the project structure at `spec/`
  - Run `rspec .` to run all tests at the project root directory

- Front-end:
  - We use cypress for end-to-end testing
  - Run `npx cypress open` at the project root directory to open the test suite
  - Run the tests there

# Docker

- Pay attention that the postgresql server must not be running locally due to the ports being used by the service
- On the project root directory:
  - Run `docker-compose build`
  - Run `docker-compose up`
  - In a new terminal run:
    - `docker exec -it ${docker_container_name} /bin/bash` where ${docker_container_name} is the name of the container, to see it, run `docker ps -a`
    - Run the commands explained in the Database creation section

# Project Structure

This project follows a standard Ruby on Rails application structure with some additions for testing and frontend development. Here's a breakdown of the main directories and their contents:

```
├── app # Core application logic
│ ├── assets # Static assets (images, stylesheets, etc.)
│ │ ├── config # Asset configuration
│ │ ├── images # Image files
│ │ ├── stylesheets # CSS files
│ │ └── builds # Compiled assets
│ ├── channels # Real-time communication channels (Action Cable)
│ │ └── application_cable # Base Action Cable channel
│ ├── controllers # Controllers handling web requests
│ │ ├── api # API controllers
│ │ ├── concerns # Shared controller modules
│ │ └── application_controller.rb # Base controller
│ ├── helpers # View helper modules
│ │ ├── application_helper.rb # Base helper
│ │ └── homepage_helper.rb # Helper for homepage views
│ ├── jobs # Background jobs (Active Job)
│ │ └── application_job.rb # Base job class
│ ├── javascript # JavaScript code (using esbuild)
│ │ ├── routes # JavaScript routes
│ │ └── components # JavaScript components
│ ├── mailers # Email sending logic (Action Mailer)
│ │ └── application_mailer.rb # Base mailer class
│ ├── models # Database models (ActiveRecord)
│ │ ├── application_record.rb # Base model class
│ │ ├── concerns # Shared model modules
│ │ └── ... # Individual model files (e.g., product.rb)
│ └── views # Templates for rendering web pages
│ ├── homepage # Views for the homepage
│ └── layouts # Layout templates
├── bin # Executable scripts
│ ├── dev # Development server script
│ ├── rake # Rake task runner
│ ├── bundle # Bundler for managing gems
│ ├── rails # Rails command-line interface
│ └── setup # Project setup script
├── config # Application configuration
│ ├── locales # Localization files
│ │ └── en.yml # English locale
│ ├── environments # Environment-specific settings
│ │ ├── development.rb # Development environment
│ │ ├── production.rb # Production environment
│ │ └── test.rb # Test environment
│ └── ... # Other configuration files (database.yml, routes.rb, etc.)
├── coverage # Code coverage reports
│ └── ... # Coverage data and reports
├── cypress # End-to-end testing with Cypress
│ ├── fixtures # Test fixtures
│ ├── integration # Integration tests
│ ├── e2e # End-to-end tests
│ └── support # Cypress support files
├── db # Database migrations and seeds
│ ├── migrate # Database migration files
│ └── seeds.rb # Database seeding script
├── docker-compose.yml # Docker Compose configuration
├── lib # Custom library code
│ └── ... # Library modules and files
├── log # Application log files
│ ├── development.log # Development log
│ ├── test.log # Test log
│ └── ... # Other log files
├── public # Publicly accessible assets
│ └── ... # Static files (HTML, images, etc.)
├── spec # Test suite
│ ├── controllers # Controller tests
│ ├── factories # Factory Bot factories
│ ├── helpers # Helper tests
│ ├── integration # Integration tests
│ ├── mailers # Mailer tests
│ ├── models # Model tests
│ ├── requests # Request tests
│ ├── support # Test support files
│ └── ... # Other test-related files
└── storage # File storage
```

**Key points:**

- **app:** The heart of this Rails application, containing models, views, controllers, and other core components.
- **bin:** Executable scripts for development and deployment tasks.
- **config:** Configuration files for the application, database, and environments.
- **coverage:** Reports generated by the code coverage tool.
- **cypress:** Files related to the Cypress end-to-end testing setup.
- **db:** Database migrations for managing schema changes and seeds for populating data.
- **docker-compose.yml:** Configuration for running the application with Docker Compose.
- **lib:** Custom library code that doesn't fit within the standard Rails structure.
- **log:** Log files generated by the application.
- **public:** Publicly accessible assets like images, stylesheets, and JavaScript files.
- **spec:** The test suite, including unit tests, integration tests, and system tests.
- **storage:** A directory for storing uploaded files or other persistent data.

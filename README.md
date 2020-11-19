# Rails Demo App

## Installation

First create a `.env` in the root folder and fill the following 2 keys from your Passbase dashboard.

```bash
PASSBASE_PUBLISHABLE_API_KEY=
PASSBASE_SECRET_API_KEY=
```

Next, run `bundle install` in the folder to install all dependencies.

## Run

In order to setup the sample database, please run the following commands:

```bash
rails db:create
rails db:migrate
rails db:setup
```

Afterwards you should have a sample database with 1 test user:

```bash
User.create(name: "Paul Testuser", email: "paul@test.com", verified_status: "null", identity_access_key: "")
```

## Run

You can then run the App with `rails s` to start the server on port `http://localhost:3000`

You see a sample integration of the 2 methods how to integrate

### Integrations

You see in file `app/views/welcome/index.html.erb` first how to integrate the Passbase button via HTML & Javascript.

In same file you can also find an integration via a custom button that leads to the hosted link from Passbase.

### Customizations

For the direct integration we prefill an email in the file `app/views/welcome/index.html.erb` in line 48.

For the hosted link, we prefill the email address and encoded it in the file `app/controllers/welcome_controller.rb`.


### Handling Webhooks

You can see in the file `app/controllers/webhook_controller.rb` how you can handle webhooks, and then query Passbase's API with the `identityAccessKey`.

# Find-A-Dev
Rails app which allows non-technical founders find the perfect developer to build their next project.

## Installation Guide

Create a .env file in the root of the app and add the following keys for Google, Github (third party authentication) and Dropbox(file uploads). You'll need to create a Google app to get the client_id and client_secret. You'll need a Github and Dropbox accounts for their respective keys.

```text
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=
DROPBOX_ACCESS_TOKEN=
```

Run `bundle install`, followed by running the migrations and populate the database with the following commands

```ruby
bundle exec rails db:migrate
bundle exec rails db:migrate RAILS_ENV=test
bundle exec db:seed
```

Then run the rails server

```ruby
bundle exec rails s
```

Navigate to the `Signup` page, create an account and check your email account for the confirmation email to activate your account an login. A simpler option is to sign in via a google or github account as no confirmation is required. After signing in complete your profile.


### Contributing

If you notice a problem you should raise a Github issue containing a clear description of the problem. Include relevant snippets of the content and/or screenshots if applicable. If you'd like to improve the app, then fork the repository, make the change to your fork and then submit a pull request.


### Features to be added in the future
[] Paginate developer/project list list  
[] Display a notification when someone has sent you a message  
[] Add option to your account page to turn notifications on/off  
[] Add tags/categories to filter developers based on skill  
[] Add friendly urls  


[This project has been licensed under the MIT open source license](LICENSE)



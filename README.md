# Find-A-Dev
Rails app which allows non-technical founders find the perfect developer to build their vision.

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
[] Paginate developer/opportunity list list  
[] Display a notification when someone has sent you a message  
[] Add option to your account page to turn notifications on/off  
[] Add tags/categories to filter developers based on skill  
[] Add friendly urls  



[This project has been licensed under the MIT open source license](LICENSE)

### References

Bootstrap configuration  
[Integrating Bootstrap 3 into a Rails App](https://rails.devcamp.com/professional-rails-development-course/ui-ux-integration/implementing-twitter-bootstrap-into-a-rails-application)  
[Organising Stylesheets in a Rails App](https://mattboldt.com/organizing-css-and-sass-rails/)  

Email configuration:  
[Configure Devise to send a confirmation email](https://github.com/plataformatec/devise/wiki/How-To:-Use-custom-mailer)  
[Custom Mailer](https://github.com/plataformatec/devise/wiki/How-To:-Use-custom-mailer)  
[Setup mailcatcher gem to capture emails](https://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise)

Authentication using Devise  
[Authentication using Devise](https://rails.devcamp.com/trails/dissecting-rails-5/campsites/rails-5-authentication)  
[Enable email confirmation via Devise](https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users)  
[Devise docs on setting up omniauth strategy using Facebook](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)  
[Setting up multiple providers using omniauth and Devise](https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application)  
[Google Omniauth Strategy](https://github.com/zquestz/omniauth-google-oauth2)  
[Github Omniauth Strategy](https://github.com/omniauth/omniauth-github)  

Messaging  
[Create a simple messaging system for rails](https://medium.com/@danamulder/tutorial-create-a-simple-messaging-system-on-rails-d9b94b0fbca1)  
[Rails chat application](https://www.nopio.com/blog/rails-real-time-chat-application-part-1/)   

UI Layout/Design
[UI Theme](https://www.creative-tim.com/product/paper-kit)  
[Signin/signup form](https://dribbble.com/shots/1816129-25DaysOf-io-Login/attachments/301216)  
[Developer/Project listing](http://lesseverything.com/)  


File uploads  
[Carrierwave and image uploads](https://rails.devcamp.com/dissecting-rails-5/images-videos-rails-5/deep-dive-installing-configuring-carrierwave-image-uploads-rails-5)  
[File uploads to Dropbox](https://github.com/robin850/carrierwave-dropbox)  

Miscellaneous  
[Single Table Inheritance](http://www.informit.com/articles/article.aspx?p=2220311&seqNum=4)  

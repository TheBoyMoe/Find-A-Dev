# Find-A-Dev
Rails app which allows non-technial founders find the perfect developer to bring their vision to the market

### Using Capybara

Place your Capybara specs in `spec/features`, or alternately tag your spec example groups with `type: :feature`, e.g. 

```ruby
describe "the signin process", type: :feature do
	it "signs me in" 
	it "signs me out"
end
```

Use `js: true` tag to use the the javascript driver, selenium by default, e.g.

```ruby
describe 'some stuff which requires js', js: true do
	it 'will use the js driver'
end
```

To use javascript in you Cucumber scenarios, tag your scenarios with the `@javascript` tag.


### TODO

[x] Redirect users to their profile page until it has been completed
[] Allow users to create/edit their profiles
[] List Developer Profiles
[] Allow founders the ability to create opportunities
[] List founder opportunities
[] Add messaging system


[] Add search of developers
[] Send email notification when someone has sent you a message
[] Add option to your account page to turn notifications on/off



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
 
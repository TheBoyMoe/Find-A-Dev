# Specifications for the Rails Assessment


has_many :user_social_links
  has_many :social_links, through: :user_social_links
  
Specs:
- [x] Using Ruby on Rails for the project
	- the project was built with the Rails 5.1.5 version
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
	- the User model `has_many` conversations, messages, opportunities
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
	- the Message model `belongs_to` Conversation, in turn Conversation `has_many` messages
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
	- the User model `has_many` user_social_links, and `has_many` social_links, `through` user_social_links
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
	- the submittable attribute is `user.social_links`
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
	- use a nested form to complete the user profile, which uses two custom attribute writers `social_links_attributes=` and `user_skills_attributes=`	
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	- THe following models include validations: User, Conversation, Message and Opportunity
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	- User model, scope method is User.developers, url: '/users/developers'
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
	- Signin/up and out provided by Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
	- Signin via Google and Github using Devise Omniauth module
- [x] Include nested resource show or index (URL e.g. users/2/recipes) 
 	-	/conversations/:conversation_id/messages  
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) 
	- /conversations/:conversation_id/messages/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
	- validation errors are checked in `shared/errors` partial which is rendered in the user profile form as well as else where

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate



# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
- [ ] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
- [ ] Use your Rails API and a form to create a resource and render the response without a page refresh.
- [ ] Translate JSON responses into js model objects.
- [ ] At least one of the js model objects must have at least one method added by your code to the prototype.

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message

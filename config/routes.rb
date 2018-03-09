Rails.application.routes.draw do
	default_url_options :host => "example.com"

	devise_for :users, path: '',
	 controllers: {
			 registrations: 'registrations',
			 omniauth_callbacks: 'users/omniauth_callbacks'
	 }

	resources :users, only: [:show, :edit, :update, :index]

	root to: 'static#home'

	# routes
	# new_user_session 				GET    /sign_in(.:format)       devise/sessions#new
	# user_session 						POST   /sign_in(.:format)       devise/sessions#create
	# destroy_user_session 		DELETE /sign_out(.:format)      devise/sessions#destroy
	# new_user_registration 	GET    /sign_up(.:format)       registrations#new

end

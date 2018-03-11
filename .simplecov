SimpleCov.start 'rails' do
	add_filter "app/controllers/registrations_controller.rb"
	add_filter "app/controllers/users/omniauth_callbacks_controller.rb"
	add_filter "app/mailers/application_mailer.rb"
	add_filter "app/helpers/devise_helper.rb"
	add_filter "app/uploaders/image_uploader.rb"
end
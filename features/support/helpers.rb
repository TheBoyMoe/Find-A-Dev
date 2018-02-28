module Helpers

	def create_visitor
		@visitor ||= {
				name: "Peter Parker",
				email: 'peterparker@example.com',
				password: 'password',
				password_confirmation: 'password'
		}
	end

	def create_user

	end

	def delete_user

	end

	def sign_up
		visit new_user_registration_path
		fill_in 'user_name', with: @visitor[:name]
		fill_in 'user_email', with: @visitor[:email]
		fill_in 'user_password', with: @visitor[:password]
		fill_in 'user_password_confirmation', with: @visitor[:password_confirmation]
		click_button 'Sign up'
	end

	def sign_in
		visit new_user_session_path
		fill_in 'user_email', with: @visitor[:email]
		fill_in 'user_password', with: @visitor[:password]
		fill_in 'user_password_confirmation', with: @visitor[:password_confirmation]
		click_button 'Sign in'
	end

	def sign_out

	end

	def sign_in_with_valid_data(email, password, password_confirmation)
		visit new_user_session_path
		fill_in 'user_email', with: email
		fill_in 'user_password', with: password
		fill_in 'user_password_confirmation', with: password_confirmation
		click_button 'Sign in'
	end

	def sign_up_with_valid_data(name, email, password, password_confirmation)
		visit new_user_registration_path
		fill_in 'user_name', with: name
		fill_in 'user_email', with: email
		fill_in 'user_password', with: password
		fill_in 'user_password_confirmation', with: password_confirmation
		click_button 'Sign up'
	end


end

World(Helpers)

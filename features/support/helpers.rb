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
		@user ||= FactoryBot.create(:user, create_visitor)
		@current_user = @user
	end

	def delete_user
		@user.destroy if @user
		@user = nil
		@current_user = nil
	end

	def activate_account
		@user.confirmed_at = Time.now.utc
		@user.save
	end

	def activate_current_user(email)
		user = User.find_by(email: email)
		user.confirmed_at = Time.now.utc
		user.save
	end

	def create_activated_user(name, email, password)
		user = User.new(name: name, email: email, password: password, password_confirmation: password)
		user.confirmed_at = Time.now.utc
		user.save
		ActionMailer::Base.deliveries.clear
	end

	def create_omniauth_user(provider)
		create_user
		@user.merge(uid: '12345678', provider: provider)
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
		click_button 'Sign in'
	end

	def sign_out

	end

	def sign_in_with_valid_data(email, password)
		visit new_user_session_path
		fill_in 'user_email', with: email
		fill_in 'user_password', with: password
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

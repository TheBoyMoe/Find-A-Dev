FactoryBot.define do
	factory :user do
		name 'Mock User'
		email 'mock@example.com'
		password 'password'
		password_confirmation {password}
		uid '12345678'
		provider 'google'
		bio 'text'
		confirmed_at nil
		role 0
		conversations []
	end
end
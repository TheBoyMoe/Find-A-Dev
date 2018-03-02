FactoryBot.define do
	factory :user do
		name 'Mock User'
		email 'mock@example.com'
		password 'password'
		password_confirmation {password}
		uid '12345678'
		provider 'google'
	end
end
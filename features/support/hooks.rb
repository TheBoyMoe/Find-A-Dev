Before('@omniauth') do
	OmniAuth.config.test_mode = true
	OmniAuth.config.mock_auth[:github] = {
			'provider' => 'github',
			'uid' => '12345678',
			'info' => {
					'email' => 'mock@example.com',
					'name' => 'Mock User'
			}
	}
	OmniAuth.config.mock_auth[:google] = {
			'provider' => 'google',
			'uid' => '12345678',
			'info' => {
					'email' => 'mock@example.com',
					'name' => 'Mock User'
			},
			'credentials' => {'token' => 'test_token'}
	}
end

Before('@omniauth-with-invalid-credentials') do
	OmniAuth.config.test_mode = true
	OmniAuth.config.mock_auth[:google] = :invalid_credentials
	OmniAuth.config.mock_auth[:github] = :invalid_credentials
end

Before('@omniauth-without-email') do
	OmniAuth.config.test_mode = true
	OmniAuth.config.mock_auth[:github] = {
			'provider' => 'github',
			'uid' => '12345678',
			'info' => {}
	}
	OmniAuth.config.mock_auth[:google] = {
			'provider' => 'google',
			'uid' => '12345678',
			'info' => {},
			'credentials' => {'token' => 'test_token'}
	}
end

After('@omniauth, @omniauth-without-email, @omniauth-with-invalid-credentials') do
	OmniAuth.config.test_mode = false
end
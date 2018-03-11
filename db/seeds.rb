# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def make_social_links
	social_links = %w[Facebook Twitter Github Google-Plus Linkedin]
	i = 0
	5.times do
		SocialLink.create!(
				name: social_links[i]
		)
		i += 1
	end
end

def make_users
	6.times do
		User.create!(
			name: Faker::Name.name,
			email: Faker::Internet.email,
			password: 'password',
			confirmed_at: Time.now.utc,
		)
	end
end

def update_user_profile
	social_links = %w[Facebook Twitter Github Google-Plus Linkedin]
	link = 0
	roles = %w[developer founder]
	i = 1
	6.times do
		user = User.find(i)
		user.role = roles[Random.rand(2)]
		user.bio = Faker::Lorem.paragraph
		user.main_image = "/public/profile_imgs/profile-#{i}.png"
		user.skills.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph)
		user.skills.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph)
		user.social_links.create!(name: social_links[link], url: Faker::Internet.url("#{social_links[link].downcase}.com"))
		user.save
		i += 1
		if link <= 3
			link += 1
		end
	end
end

def make_conversations
	i = 1
	5.times do
		user_a = User.find(i)
		user_b = User.find(i + 1)
		conversation = Conversation.create!(
			title: Faker::Lorem.sentence,
			initiator_id: user_a.id,
			recipient_id: user_b.id
		)
		4.times do
			conversation.messages.create!(content: Faker::Lorem.paragraph, sender: user_a)
			conversation.messages.create!(content: Faker::Lorem.paragraph, sender: user_b)
		end

		i += 1
	end
end


make_social_links
make_users
update_user_profile
make_conversations
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
	User.create!(
		name: 'Tom Jones',
		email: 'tom@ex.com',
		password: 'password',
		confirmed_at: Time.now,
	)
	User.create!(
		name: 'Grace Jones',
		email: 'grace@ex.com',
		password: 'password',
		confirmed_at: Time.now,
	)
	User.create!(
		name: 'Peter Jones',
		email: 'peter@ex.com',
		password: 'password',
		confirmed_at: Time.now,
	)
	User.create!(
		name: 'Simon Jones',
		email: 'simon@ex.com',
		password: 'password',
		confirmed_at: Time.now,
	)
end

def update_user_profile
	social_links = %w[Facebook Twitter Github Google-Plus Linkedin]
	link = 0
	roles = %w[developer founder]
	i = 1
	4.times do
		user = User.find(i)
		user.role = roles[Random.rand(2)]
		user.bio = Faker::Lorem.paragraph(6)
		user.user_skills.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph)
		user.user_skills.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph)
		user.social_links.create!(name: social_links[link], url: Faker::Internet.url("#{social_links[link].downcase}.com"))
		user.save
		i += 1
		if link <= 3
			link += 1
		end
	end
end

def create_conversation
	i = 1
	3.times do
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

def create_additional_conversations
	user_a = User.find(1)
	i = 0
	users = [User.find(3), User.find(4)]
	2.times do
		conversation = Conversation.create!(title: Faker::Lorem.sentence, initiator_id: user_a.id, recipient_id: users[i].id)
		4.times do
			conversation.messages.create!(content: Faker::Lorem.paragraph, sender: user_a)
			conversation.messages.create!(content: Faker::Lorem.paragraph, sender: users[i])
		end
		i += 1
	end
end

def create_projects
  i = 1
  2.times do
    user = User.find(i)
    project = Project.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      author_id: user.id
    )
    project.project_skills.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph)
    i += 1
  end
end

make_social_links
make_users
update_user_profile
create_conversation
create_additional_conversations
create_projects

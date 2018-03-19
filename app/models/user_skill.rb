class UserSkill < Skill
	belongs_to :user, foreign_key: :skill_id

	def self.search(query)
		term = "%#{query}%"
		where('title LIKE ? or description LIKE ?', term, term)
	end
end
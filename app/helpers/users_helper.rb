module UsersHelper

	def add_social_link_field(name, f, association)
		new_object = f.object.send(association).klass.new # build a new answer instance
		id = new_object.object_id # generate a unique 'id' for the object

		# build a fields_for instance for the new answer, passing in a builder
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			# render the _answer_fields partial
			render(association.to_s.singularize + "_field", f: builder)
		end
		# generate a link to add more fields using js
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

end
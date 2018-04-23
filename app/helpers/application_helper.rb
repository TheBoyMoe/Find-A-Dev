module ApplicationHelper

	def home_link
		if user_signed_in?
			link_to "Find A Dev", welcome_path, class: "navbar-brand"
		else
			link_to "Find A Dev", root_path, class: "navbar-brand"
		end
	end

  def user_avatar(img)
    if img.model.main_image?
      img
    else
      'avatar-placeholder.png'
    end
  end
end

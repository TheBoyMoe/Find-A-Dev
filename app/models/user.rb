class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google, :github]

  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  # generate user based on omniauth data received from 3rd party providers
  def self.from_omniauth(auth)
    user = User.find_by_email(auth['info']['email'].downcase)
    # user has an existing account via devise/google
    if user
      self.update_user_attributes(user, auth)
    else
      self.sign_in_with_provider(auth)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = (session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]) ||
          (session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"])
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private
    def self.update_user_attributes(user, auth)
      user.update_attributes(provider: auth['provider'], uid: auth['uid'])
      user
    end

    def self.sign_in_with_provider(auth)
      where(provider: auth['provider'], uid: auth['uid']).first_or_create! do |user|
        user.email = auth['info']['email']
        user.password = Devise.friendly_token[0,20]
        user.name = auth['info']['name']
        # user.image = auth.info.image # assuming the user model has an image
        user.skip_confirmation! # don't send the user a confirmation email
      end
    end
end

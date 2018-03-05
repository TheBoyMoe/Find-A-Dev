class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google, :github]

  has_many :skills
  has_many :user_social_links
  has_many :social_links, through: :user_social_links
  accepts_nested_attributes_for :skills
  # accepts_nested_attributes_for :social_links # replaced by custom attribute writer

  validates_presence_of :name, :role, :bio

  # user roles
  enum role: [:user, :developer, :founder]
  after_initialize :set_default_role, if: :new_record?

  after_initialize :set_default_bio, if: :new_record?

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  # generate user based on omniauth data received from 3rd party providers
  def self.from_omniauth(auth)
    user = User.find_by_email(auth['info']['email'].downcase)
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

  def social_links_attributes=(link_attributes)
    link_names = self.social_links.pluck(:name)
    link_attributes.values.each do |link_attribute|
      if link_names && link_names.count > 0
        if link_names.include?(link_attribute[:name])
          link = self.social_links.find_by(name: link_attribute[:name])
          link.url = link_attribute[:url]
          link.save
        else
          self.social_links.create(link_attribute)
        end
      else
        self.social_links.create(link_attribute)
      end
    end
  end

  private
    def set_default_role
      self.role = :user
    end

    def set_default_bio
      self.bio = 'add bio'
    end

    def self.update_user_attributes(user, auth)
      user.update_attributes(provider: auth['provider'], uid: auth['uid'])
      user.skip_confirmation! # req'd for cuke feature to pass!
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

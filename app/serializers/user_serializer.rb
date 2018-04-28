class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :main_image
end

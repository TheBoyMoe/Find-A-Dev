class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'

  validates_presence_of :content
end
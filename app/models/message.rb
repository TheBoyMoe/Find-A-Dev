class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'

  validates_presence_of :content

  def sent_at
    created_at.strftime("%l:%M %p on %d#{created_at.day.ordinal} %B %Y")
  end
end

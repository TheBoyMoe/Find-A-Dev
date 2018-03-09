FactoryBot.define do
  factory :conversation do
    title 'start of a conversation'
    initiator_id 1
    recipient_id 1
    messages []
  end
end

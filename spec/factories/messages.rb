FactoryBot.define do
  factory :message do
    content "mesage content"
    conversation nil
    sender_id nil
    read false
  end
end

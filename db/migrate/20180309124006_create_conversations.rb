class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :title
      t.integer :initiator_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end

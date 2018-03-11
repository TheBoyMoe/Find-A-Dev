class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :conversation, foreign_key: true
      t.integer :sender_id
      t.boolean :read, default: false

      t.timestamps
    end
  end
end

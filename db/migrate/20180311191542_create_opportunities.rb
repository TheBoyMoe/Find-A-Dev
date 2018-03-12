class CreateOpportunities < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunities do |t|
      t.text :description
      t.integer :author_id

      t.timestamps
    end
  end
end

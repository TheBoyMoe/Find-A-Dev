class AddTitleToOpportunities < ActiveRecord::Migration[5.1]
  def change
    add_column :opportunities, :title, :string
  end
end

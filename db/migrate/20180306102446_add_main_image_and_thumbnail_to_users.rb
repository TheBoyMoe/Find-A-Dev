class AddMainImageAndThumbnailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :main_image, :text
    add_column :users, :thumb_image, :text
  end
end

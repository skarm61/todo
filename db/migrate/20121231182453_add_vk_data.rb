class AddVkData < ActiveRecord::Migration
  def change
    add_column :users, :vk_token, :string
    add_column :users, :login, :string
    add_column :users, :second_name, :string
    add_column :users, :url_for_vk_photo_medium, :string
    add_column :users, :id_vk, :string
  end
end
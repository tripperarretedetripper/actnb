class ChangeDefaultPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :photo, :string, default: "default_avatar.png"
  end
end

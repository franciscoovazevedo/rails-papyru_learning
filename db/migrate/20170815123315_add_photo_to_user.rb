class AddPhotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo, :string, default: "profile_default_usd3dj"
  end
end

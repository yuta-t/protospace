class ChnageColumnFromPrototype < ActiveRecord::Migration
  def change
    rename_column :users, :user_name, :username

    rename_column :prototypes, :catch_copy, :catchcopy
    change_column :prototypes, :concept, :text

    change_column :images, :image_type, :integer
  end
end

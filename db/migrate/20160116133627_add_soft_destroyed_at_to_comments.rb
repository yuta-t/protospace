class AddSoftDestroyedAtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :soft_destroyed_at, :datetime
    add_index :comments, :soft_destroyed_at
  end
end

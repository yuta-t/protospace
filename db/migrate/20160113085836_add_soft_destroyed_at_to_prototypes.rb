class AddSoftDestroyedAtToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :soft_destroyed_at, :datetime
    add_index :prototypes, :soft_destroyed_at
  end
end

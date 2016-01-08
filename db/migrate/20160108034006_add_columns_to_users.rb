class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text
    add_column :users, :occupation, :string
    add_column :users, :position, :string
  end
end

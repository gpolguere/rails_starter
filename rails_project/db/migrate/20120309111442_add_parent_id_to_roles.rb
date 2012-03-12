class AddParentIdToRoles < ActiveRecord::Migration
  def up
  	add_column :roles, :parent_id, :integer
  end

  def down
  	remove_column :roles, :parent_id
  end
end

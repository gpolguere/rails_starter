class AddDefaultRoles < ActiveRecord::Migration

	ROLES = ["super_admin", "guest"]

  def up
  	ROLES.each do |role_name|
  		Role.create :name => role_name
  	end
  end

  def down
  	ROLES.each do |role_name|
  		role = Role.find_by_name role_name
  		role.destroy
  	end
  end
end

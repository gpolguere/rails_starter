class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles, :foreign_key => "role_id", :association_foreign_key => "user_id"
  belongs_to :resource, :polymorphic => true
  has_many :children, :class_name => "Role", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Role"
end

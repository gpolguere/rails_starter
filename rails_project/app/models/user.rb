class User < ActiveRecord::Base
  include Rolify::Roles
  # extend Rolify::Dynamic
  has_and_belongs_to_many :roles, :join_table => :users_roles, :foreign_key => "user_id", :association_foreign_key => "role_id"
  accepts_nested_attributes_for :roles

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids

  def role
  	roles.first
  end

  def is?(specific_role)
    role == specific_role
  end

  def is_at_least?(specific_role)
    current_role = self.role
    begin
      if current_role.name == specific_role
        return true
      else
        current_role = current_role.parent
      end
    end while !current_role.nil?
    return false
  end

end

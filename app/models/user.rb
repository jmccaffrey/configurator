class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def can_edit?
  ['admin', 'security', 'psdev'].include?(self.role)
end

def can_rollback?
  ['psdev'].include?(self.role)
end
end

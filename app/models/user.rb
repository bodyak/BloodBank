class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :recoverable, :rememberable, :registerable
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :username, :email, :password, :password_confirmation
  # attr_accessible :title, :body
  attr_accessor :login

  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  protected

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

end

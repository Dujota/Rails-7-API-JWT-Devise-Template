class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Roles
  has_and_belongs_to_many :roles
  include UserAuthority
end

class User < ApplicationRecord
  include GraphqlDevise::Authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  def full_name
    "#{first_name} #{last_name}"
  end
end

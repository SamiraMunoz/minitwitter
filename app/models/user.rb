class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  include DeviseTokenAuth::Concerns::User
  include GraphqlDevise::Authenticatable

  def full_name
    "#{first_name} #{last_name}"
  end
end

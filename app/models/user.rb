class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  include GraphqlDevise::Authenticatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  has_many :tweets, foreign_key: :author_id

  def full_name
    "#{first_name} #{last_name}"
  end
end

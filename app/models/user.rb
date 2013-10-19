class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :pantry, inverse_of: :user, dependent: :destroy
  has_many :recipes, inverse_of: :user
end

class Pantry < ActiveRecord::Base
  belongs_to :user, inverse_of: :pantry

  has_many :pantry_ingredients, inverse_of: :pantry, dependent: :destroy
  has_many :ingredients, through: :pantry_ingredients

  validates_presence_of :user
end

class Pantry < ActiveRecord::Base
  belongs_to :user, inverse_of: :pantry

  has_many :ingredients, as: :element, dependent: :destroy

  validates_presence_of :user
end

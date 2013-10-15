class Recipe < ActiveRecord::Base
  has_many :ingredients, as: :element, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :directions
end

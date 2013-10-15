class Ingredient < ActiveRecord::Base
  belongs_to :element, polymorphic: true
end

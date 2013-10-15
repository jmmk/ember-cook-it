# require "test_helper"

# describe PantryIngredient do
#   subject { PantryIngredient.new }

#   it { must have_valid(:pantry).when(Pantry.new) }
#   it { wont have_valid(:pantry).when(nil) }

#   it { must have_valid(:ingredient).when(Ingredient.new) }
#   it { wont have_valid(:ingredient).when(nil) }

#   describe 'associations' do

#     it 'belongs to pantry' do
#       subject.must_respond_to :pantry
#     end
#     it 'belongs to ingredient' do
#       subject.must_respond_to :ingredient
#     end
#   end
# end

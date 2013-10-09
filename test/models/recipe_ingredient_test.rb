require "test_helper"

describe RecipeIngredient do
  subject { RecipeIngredient.new }

  it { must have_valid(:recipe).when(Recipe.new) }
  it { wont have_valid(:recipe).when(nil) }

  it { must have_valid(:ingredient).when(Ingredient.new) }
  it { wont have_valid(:ingredient).when(nil) }

  describe 'associations' do
    it 'belongs to recipe' do
      subject.must_respond_to :recipe
    end
    it 'belongs to ingredient' do
      subject.must_respond_to :ingredient
    end
  end
end

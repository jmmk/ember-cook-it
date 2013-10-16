require "test_helper"

describe Ingredient do
  subject { Ingredient.new }

  it { must have_valid(:name).when('Chicken', 'Rice') }
  # it { wont have_valid(:name).when('', nil) }

  describe 'associations' do

    it 'has many recipe_ingredients' do
      subject.must_respond_to :recipe_ingredients
    end

    it 'has many pantry_ingredients' do
      subject.must_respond_to :pantry_ingredients
    end

    it 'has many recipes' do
      subject.must_respond_to :recipes
    end

    it 'has many pantries' do
      subject.must_respond_to :pantries
    end
  end
end

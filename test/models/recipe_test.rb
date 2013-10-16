require "test_helper"

describe Recipe do
  subject { Recipe.new }

  it { must have_valid(:title).when('Super Chicken', 'Awesome Sauce') }
  it { wont have_valid(:title).when('', nil) }

  it { must have_valid(:directions).when('Super Chicken', 'Awesome Sauce') }
  it { wont have_valid(:directions).when('', nil) }

  describe 'associations' do

    it 'has many recipe_ingredients' do
      subject.must_respond_to :recipe_ingredients
    end
    it 'has many ingredients' do
      subject.must_respond_to :ingredients
    end
  end
end

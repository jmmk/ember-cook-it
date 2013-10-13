require "test_helper"

describe Pantry do
  subject { Pantry.new }

  it { must have_valid(:user).when(User.new) }
  it { wont have_valid(:user).when(nil) }

  describe 'associations' do

    it 'belongs to user' do
      subject.must_respond_to :user
    end
    it 'has many ingredients' do
      subject.must_respond_to :ingredients
    end
    it 'has many pantry ingredients' do
      skip 'Use simpler one-to-many for now'
      subject.must_respond_to :pantry_ingredients
    end
  end
end

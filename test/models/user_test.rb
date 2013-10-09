require "test_helper"

describe User do
  subject { User.new }

  describe 'associations' do

    it 'has one pantry' do
      subject.must_respond_to :pantry
    end
  end
end

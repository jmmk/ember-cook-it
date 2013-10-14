class User < ActiveRecord::Base
  has_one :pantry, inverse_of: :user, dependent: :destroy
end

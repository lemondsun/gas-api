class Price < ApplicationRecord
  has_many :users, :dependent => :destroy
end

class User < ApplicationRecord
  validates :name, :age, :email, presence: true
end

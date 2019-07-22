class User < ApplicationRecord
  has_secure_password
  has_many :projects

  validates_presence_of :name, :last_name, :username, :country
end

class User < ApplicationRecord
    validates :username, :presence => true, :uniqueness => true
    validates :email, :presence =>true, :uniqueness => true,  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end

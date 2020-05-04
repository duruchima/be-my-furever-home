class User < ApplicationRecord
    has_many: :comments
    has_many: :pets, through: :comments
end

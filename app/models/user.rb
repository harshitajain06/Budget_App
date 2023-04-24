class User < ApplicationRecord
    has_many :categories
    has_many :transacs

    validates :name, presence: true
  end
  
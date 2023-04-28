class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :transacs

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 50 }
end

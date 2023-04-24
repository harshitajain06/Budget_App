class Transac < ApplicationRecord
    belongs_to :user
    has_many :categories

    validates :name, presence: true
    validates :amount, presence: true
  end
  
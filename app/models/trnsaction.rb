class Trnsaction < ApplicationRecord
    belongs_to :author, class_name: 'User'

    has_many :transaction_categories
    has_many :ctegories, through: :transaction_categories

    validates :name, presence: true, uniqueness: true
    validates :amount, presence: true, numericality: { greater_than: 0 }
end

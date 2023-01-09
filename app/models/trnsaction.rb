class Trnsaction < ApplicationRecord
    belongs_to :author, class_name: 'User'

    has_many :transaction_categories
    has_many :ctegories, through: :transaction_categories

    
end

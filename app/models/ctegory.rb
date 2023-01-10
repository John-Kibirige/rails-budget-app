class Ctegory < ApplicationRecord
    belongs_to :author, class_name: 'User'

    has_many :transaction_categories
    has_many :trnsactions, through: :transaction_categories

    validates :name, presence: true, uniqueness: true
    validates :icon, presence: true

end

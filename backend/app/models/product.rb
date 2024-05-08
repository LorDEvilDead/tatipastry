class Product < ApplicationRecord
    validates :name, presence: true, lenght: {maximum: 100}
end

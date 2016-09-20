class Category < ApplicationRecord
	has_and_belongs_to_many :articles
	has_one :picture, as: :imageable
end

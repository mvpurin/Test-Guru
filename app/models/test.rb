class Test < ApplicationRecord
	belongs_to :category

	def self.find_test_by_category(category)
		self.joins("JOIN categories 
			ON tests.category_id = categories.id 
			WHERE categories.title = :category", category: category)
	end
end

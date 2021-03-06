class Product < ActiveRecord::Base
	validates :description, :name, presence: true
	validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}

	has_many :reviews

	def formatted_price
		price_in_dollars = (price_in_cents.to_f / 100) * 100
		format("$%.2f", price_in_dollars)
	end

	def self.search(search)
  		if search
    	 resultsA = self.where('name LIKE ?', "%#{search}%")
    	 resultsB = self.where('description LIKE ?', "%#{search}%")
  		else
    		all
  		end
  		resultsB.length == 0 ? resultsA : resultsB
	end



end

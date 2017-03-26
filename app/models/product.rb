class Product < ApplicationRecord
	has_may :orders
end

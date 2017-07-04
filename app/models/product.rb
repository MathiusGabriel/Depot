class Product < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_line_item

	has_many :line_items
	has_many :orders, through: :line_items

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :title, length: {
		minimum: 3,
		too_short: "must be at least 3 characters long"}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'Must be a URL for GIF, JPG or PNG image'
	}

=begin
Moje pytanie dotyczące dodatkowych testów tyczy się części modelu, która jest poniżej,
bo to co napisałem w specu generalnie obejmuje to co powyżej. Czy to też w jakiś sposób powinno być przetestowane
w specu z testami modelu?
=end

	def self.latest
		Product.order(:updated_at).last
	end

	private
	#ensure that there are no line items referencing to this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end

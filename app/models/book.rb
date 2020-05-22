class Book < ApplicationRecord

	belongs_to :user

	validates :body, length: { maximum: 200 }
	validates :body,:title,  presence: true

end

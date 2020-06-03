class Book < ApplicationRecord

	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

	validates :body, length: { maximum: 200 }
	validates :body,:title,  presence: true

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end

class Tag < ApplicationRecord

	has_many :post_tags , dependent: :destroy
	has_many :posts, through: :post_tags , dependent: :destroy

	validates :name, presence: true

	def in_use?
		PostTag.exists?(tag_id: self.id)
	end
end

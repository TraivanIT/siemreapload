class Post < ApplicationRecord
  belongs_to :traivan

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags,  dependent: :destroy
  has_many :comments , dependent: :destroy

  validates :title , presence: true
  validates :content , presence: true
  

  def self.post_search(search)
  	where("title LIKE ? OR content LIKE ?", "%#{search}%" , "%#{search}%")
  end
end

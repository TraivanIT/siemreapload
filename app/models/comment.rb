class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :visitor
  has_many :notofications, as: :notifiable
end

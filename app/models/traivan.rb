class Traivan < ApplicationRecord
	has_secure_password
	has_many :posts
	validates :fullname , presence: true 
	validates :username , format: {with: /@/ , message: 'Is not valid user'}
	validates :password , presence: true 
end

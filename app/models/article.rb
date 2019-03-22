
class Article < ApplicationRecord

	include ActiveModel::SecurePassword

	has_many :comments, dependent: :destroy
	validates :title, presence: true
	#validates :title, uniqueness: {case_sensitive: false} 
	validates :title, on: [:create, :update], format: {with: /\A[a-zA-Z ?]+\z/ , message: "only allows letters"}  



end

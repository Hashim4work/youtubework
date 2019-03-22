class Comment < ApplicationRecord
 	belongs_to :article
  	validates :commenter, presence: true
  	validates :commenter, numericality: true
end

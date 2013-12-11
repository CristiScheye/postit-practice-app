class Comment < ActiveRecord::Base
  include VoteableTestCms

	belongs_to :user
	belongs_to :post

	validates :body, presence: true


end
class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :voteable, polymorphic: true

  validates :voteable, uniqueness: {scope: :user_id}, presence: true
end
class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :voteable, polymorphic: true

  validates :user, uniqueness: {scope: :voteable}
  # another syntax--> validates_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
end
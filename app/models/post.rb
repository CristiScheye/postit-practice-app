class Post < ActiveRecord::Base
  include VoteableTestCms

	belongs_to :user
	has_many :comments

	has_many :post_categories
	has_many :categories, through: :post_categories

	validates :title, presence: true
	validates :url, presence: true
	validates :description, presence: true

  before_save :make_slug

  def make_slug
    self.slug = self.title.gsub(/[\s\W]/,'-').downcase
  end

  def to_param
    self.slug
  end
  
end
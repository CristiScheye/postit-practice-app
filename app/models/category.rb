class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories

	validates :name, presence: true
  before_save :make_slug

  def make_slug
    self.slug = self.name.gsub(/[\s\W]/,'-').downcase
  end

  def to_param
    self.slug
  end
end
class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :votes

	has_secure_password validations: false

	validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3}
	validates :password, presence: true, on: :create, length: {minimum: 5}

  before_save :proper_case

  def proper_case
    self.username = self.username.titleize
  end

end
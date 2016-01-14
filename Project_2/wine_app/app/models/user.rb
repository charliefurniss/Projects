class User < ActiveRecord::Base
	has_secure_password
	has_many :bottles
	has_many :notes, through: :bottles
	has_many :wines, -> {distinct}, through: :bottles
	validates :email, presence: true, uniqueness: true
end

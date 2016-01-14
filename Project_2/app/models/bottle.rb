class Bottle < ActiveRecord::Base
	belongs_to :user
	belongs_to :wine
	has_many :notes
end

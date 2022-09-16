class Music < ApplicationRecord
	has_one_attached :song_file
	has_many :users, :through => :likes
    has_many :likes, dependent: :destroy
    has_many :playlist, dependent: :destroy

  	def self.search(search)
    	where("artist_name LIKE ?", "%#{search}%")
	end

	def self.search_all(search)
   	 where("composer LIKE ?", "%#{search}%")
	end
end

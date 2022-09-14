class Music < ApplicationRecord
	has_one_attached :song_file
	has_many :users, :through => :likes
    has_many :likes, dependent: :destroy

  def self.search(search)
 	 if search
    	where('artist_name LIKE ?', "%#{search}%")
  	else
    	find(:all)
  	end
end

	def self.search_all(search)
   	 where("composer like ?", "%#{search}%")
	end
end

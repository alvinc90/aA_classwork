class ShortenedUrl < ApplicationRecord 
    validates :long_url, :short_url, :user_id, presence: true, uniqueness: true 

end
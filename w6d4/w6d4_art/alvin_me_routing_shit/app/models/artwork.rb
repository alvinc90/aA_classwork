# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :integer          not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id,
    message: "An artist cannot use the same title more than once!" }

    belongs_to :artist, 
        foreign_key: :artist_id, 
        class_name: :User 

    has_many :shares,
      foreign_key: :artwork_id,
      class_name: :ArtworkShare

    has_many :shared_viewers,
      through: :shares,
      source: :viewer

end

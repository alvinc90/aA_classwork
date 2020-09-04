class ArtworksController < ApplicationController
    def index 
        artworks = Artwork.all 
        render json: artworks 
    end

    def show 
        artwork = Artwork.find(params[:id]) 
        render json: artwork 
    end

    def create 
        artwork = Artwork.new(artwork_params)

        if artwork.save 
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: unprocessable_entity 
        end
    end

    private 
    def artwork_params 
        params.require(:artwork).permit(:artist_id, :image_url, :title)
    end
end

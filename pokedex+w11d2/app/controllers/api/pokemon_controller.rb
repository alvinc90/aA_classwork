class Api::PokemonController < ApplicationController

    def index
        @pokemon = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find_by(id: params[:id])
        # render json: @pokemon
        render :show 
    end

end

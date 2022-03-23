class Api::V1::PokemonsController < ApplicationController
    def show
        pokemon = Pokemon.find(params[:id])
        render json: pokemon
    end
end

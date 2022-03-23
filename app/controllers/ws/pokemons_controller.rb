class Ws::PokemonsController < ApplicationController
    URL ||= 'https://pokeapi.co/api/v2'
    def show
        pokemon = HTTParty.get("#{URL}/pokemon/#{params[:id]}")
        render json: pokemon
    end
end
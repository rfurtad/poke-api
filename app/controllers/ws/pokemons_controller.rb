class Ws::PokemonsController < ApplicationController
    URL ||= 'https://pokeapi.co/api/v2'

    def index
        return invalid_limit_or_offset unless params[:limit] && params[:offset]
        render json: HTTParty.get("#{URL}/pokemon?limit=#{params[:limit]}&offset=#{params[:offset]}")
    end

    def show
        pokemon = HTTParty.get("#{URL}/pokemon/#{params[:id]}")
        render json: pokemon
    end

    private

    def invalid_limit_or_offset
        render json: { error: 'Invalid params, you must specify an offset and limit'}
    end
end
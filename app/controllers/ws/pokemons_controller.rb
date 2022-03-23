class Ws::PokemonsController < ApplicationController
    URL ||= 'https://pokeapi.co/api/v2/pokemon'

    def index
        return invalid_limit_or_offset unless params[:limit] && params[:offset]
        render json: HTTParty.get("#{URL}?limit=#{params[:limit]}&offset=#{params[:offset]}")
    end

    def show
        pokemon = HTTParty.get("#{URL}/#{params[:id]}")
        render json: pokemon
    end

    private

    def invalid_limit_or_offset
        render json: { error: 'Invalid params, you must specify an offset and limit'}
    end
end
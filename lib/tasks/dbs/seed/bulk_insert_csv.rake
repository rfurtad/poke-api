# frozen_string_literal: true
require 'csv'
namespace :dbs do
    namespace :seed do
        desc "TODO"
        task :bulk_insert_csv => :environment do
            pokemons = []
            CSV.foreach('pokemon.csv', :headers => true, header_converters: :symbol) do |row|                            
                pokemons << row.to_h                            
            end
            Pokemon.insert_all!(pokemons)                
        end
    end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# For better performance we can try load data in batch and insert in batches
require 'csv'
CSV.foreach('pokemon.csv', :headers => true, header_converters: :symbol) do |row|
    Pokemon.create!(row.to_h)
end
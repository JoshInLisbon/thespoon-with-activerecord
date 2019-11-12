# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all restrauants"
Restaurant.destroy_all
# this will mean that your id 1 will not exist if you reseed

puts "making three restarants"
Restaurant.create(name: '1bla', address: '54', rating: 2)
Restaurant.create(name: '2bla', address: '54', rating: 4)
Restaurant.create(name: '3bla', address: '54', rating: 5)

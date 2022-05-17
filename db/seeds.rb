# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bag.destroy_all
Lot.destroy_all

brazil = Lot.create!(name: 'Brazil Guaxupe Natural', importer: 'Genuine Origin', lot_number: 22, organic: false)
mexico = Lot.create!(name: 'Mexico Veracrus Seleccion Huatusco', importer: 'Olam Specialty Coffee', lot_number: 20,
                     organic: true)
ethiopia = Lot.create!(name: 'Ethiopia Guji Hambela, Dame Dabaye Washing Station', importer: 'Atlas Coffee Importers',
                       lot_number: 18, organic: true)

brazil.bags.create!(name: 'Slightly Dangerous', ground: true, size: 340)
brazil.bags.create!(name: 'Brazil Single Origin', ground: true, size: 340)
brazil.bags.create!(name: 'Tail Wind', ground: true, size: 340)

mexico.bags.create!(name: 'Blonde Bomber', ground: true, size: 60)
mexico.bags.create!(name: 'Mexico Single Origin', ground: false, size: 340)
mexico.bags.create!(name: 'Blonde Bomber', ground: true, size: 340)

ethiopia.bags.create!(name: 'Ethiopia Single Origin', ground: true, size: 340)
ethiopia.bags.create!(name: 'Blonde Bomber', ground: true, size: 340)
ethiopia.bags.create!(name: 'Slightly Dangerous', ground: true, size: 60)

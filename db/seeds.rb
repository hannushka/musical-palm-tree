# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Contest.create(name: "Eurovision 2017")
Contest.first.contestants.create(start_nbr: 1, country: "Sverige", title: "Statements - Loreen")
Contest.first.contestants.create(start_nbr: 1, country: "Test", title: "TestTest")

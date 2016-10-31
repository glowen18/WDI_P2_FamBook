# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {name: 'Gaye Lowenstein', email: 'glowen@hotmail.com', mobile: '(310) 850-9896', address: "1032 19th St, No. 4, Santa Monica, CA 90403", dob: "May 24, 1962"}
  ])

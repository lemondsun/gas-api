# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
prices = Price.create([
{
  price: 200.5
},
{
  price: 210.5
},
{
  price: 190.5
},
{
  price: 230.5
},
])

users = User.create([
  {
  email: 'lemondsun@gmail.com',
  telegram: 'null',
  price: prices.first
},
{
  email: 'wjasonmulings@gmail.com',
  telegram: 'null',
  price: prices.first
},
{
  email: 'wjasonmullings@gmail.com',
  telegram: 'null',
  price: prices.first
},
])
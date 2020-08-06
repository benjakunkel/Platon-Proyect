# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destruyendo base de datos actual..."
puts "...."

  Shop.delete_all
  User.delete_all
  #Product.destroy_all

puts "Base de datos destruida"

puts "-------------------------------------"

puts  "Comenzando la creacion de usuarios"

puts "Creando Owner"
owner = User.create(email:"owner@gmail.com", first_name:"Dueno", last_name:"Del local", password:"123456",phone_number:"12345687", address:"Florida 840 CABA, Argentina", role: "owner")
puts "Owner creado"

puts "-------------------------------------"

puts "Creando User normal"
user = User.create(email:"user@gmail.com", first_name:"Usuario", last_name:"Normal", password:"123456",phone_number:"123452687", address:"Calle 43 771 La Plata, Argentina", role: "user")
puts "Usuario normal creado"

puts "-------------------------------------"

puts "Creando Owner 2"
owner2 = User.create(email:"owner2@gmail.com", first_name:"Dueno2", last_name:"Del local2", password:"123456",phone_number:"1222344445687", address:"Estado de israel 827 Misiones, Argentina", role: "owner")
puts "Owner2 creado"

puts "-------------------------------------"

puts  "Comenzando la creacion de shops"

puts "Creando Shop Panaderia rita"
shop = Shop.create(name:"Panaderia Rita", address: "Av Libertador 1900 CABA, Argentina", email:"panaderiarita@gmail.com", phone_number:"011-154552345", user_id:1)
puts "Panaderia rita creada"

puts "-------------------------------------"

puts "Creando Shop Rotiseria Pépe"
roti = Shop.create(name:"Rotiseria Pépe", address: "Tucuman 540 CABA, Argentina", email:"rotipepe@gmail.com", phone_number:"011-153552345", user_id:3)
puts "Rotiseria Pépe creada"

puts "-------------------------------------"

puts "Finalizando Seed con:"
puts "Usuarios: #{User.count} ( 2 owner, 1 user)"
puts "Shops: #{Shop.count} ( 2 owner, 1 user)"




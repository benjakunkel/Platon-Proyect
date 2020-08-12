#creo 5 owners
#creo 5 shops
# Dentro de cada shop voy a agregar 3 productos
# En uno vamos a tener 8 productos
#creo 1 user
require_relative "./seeds/users.rb"
require_relative "./seeds/shops.rb"


puts "Dropeando la base de datos"
CartItem.delete_all
Cart.delete_all
Product.delete_all
Shop.delete_all
User.delete_all

puts "Creando usuarios"

USERS.each do |user|
  puts "Creaando USER #{user[:first_name]} #{user[:last_name]} ..."
  User.create!(user)
end

puts "Usuarios creados...."
puts "#{User.count}"

owners = User.where(role: "owner")

puts "Creando shopss..."

SHOPS.each_with_index do |shop, index|

  puts "Creando SHOP #{shop[:name]} ..."
  new_shop = Shop.new(shop.except(:photo, :products))
  new_shop.photo.attach(io: open(shop[:photo]),filename: shop[:name])
  new_shop.user_id = owners[index].id

  shop[:products].each do |product|
    puts "Creando PRODUCTO #{product[:name]} .."
    puts product[:photo]
    new_product = Product.new(product.except(:photo))
    new_product.photo.attach(io: open(product[:photo]),filename: product[:name])
    new_shop.products << new_product
  end

  new_shop.save!
end

puts "Shops creados..."
puts "#{Shop.count}"


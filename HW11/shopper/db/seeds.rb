# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Category
Category.create(title: 'Laptops and computers')
Category.create(title: 'Smartphones, TV and electronics')
Category.create(title: 'Clothes, shoes and jewelry')

# Product
Product.create(name: 'Computer ARTLINE',
               description: 'Gaming ASUS Edition X43 (X43v33) Ryzen 5 3600/RAM 16ГБ/HDD 1ТБ + SSD 240ГБ/GeForce RTX 3050 8ГБ/Wi-Fi', price: 898, image: 'https://content2.rozetka.com.ua/goods/images/big/244859893.jpg')
Product.create(name: 'Laptop Acer Aspire 7', description: 'A715-42G-R8BL (NH.QDLEU.008) Charcoal Black', price: 978,
               image: 'https://content1.rozetka.com.ua/goods/images/big/254116608.jpg')
Product.create(name: 'Apple MacBook Air 13', description: 'M1 256GB 2020 (MGND3) Gold', price: 1021, image: 'https://content.rozetka.com.ua/goods/images/big/30872664.jpg')
Product.create(name: 'TV Samsung', description: 'UE50AU7100UXUA', price: 655, image: 'https://content.rozetka.com.ua/goods/images/big/303985202.jpg')
Product.create(name: 'Apple iPhone 13', description: '128GB Pink ', price: 766, image: 'https://content2.rozetka.com.ua/goods/images/big/221214151.jpg')
Product.create(name: 'T-shirt COS', description: '0960679 S white', price: '28', image: 'https://content2.rozetka.com.ua/goods/images/big/298330107.jpg')
Product.create(name: 'Jack Wolfskin down jacket', description: 'Crystal Palace Coat 1204131-5066', price: '344',
               image: 'https://content2.rozetka.com.ua/goods/images/big/251426267.jpg')
Product.create(name: 'Pendant with Swarovski crystals', description: '9299 Italina', price: '98', image: 'https://content1.rozetka.com.ua/goods/images/big/245243741.jpg')

# Product_categories
ProductCategory.create(product_id: 1, category_id: 1)
ProductCategory.create(product_id: 1, category_id: 2)
ProductCategory.create(product_id: 2, category_id: 1)
ProductCategory.create(product_id: 2, category_id: 2)
ProductCategory.create(product_id: 3, category_id: 1)
ProductCategory.create(product_id: 3, category_id: 2)
ProductCategory.create(product_id: 4, category_id: 2)
ProductCategory.create(product_id: 5, category_id: 2)
ProductCategory.create(product_id: 6, category_id: 3)
ProductCategory.create(product_id: 7, category_id: 3)
ProductCategory.create(product_id: 8, category_id: 3)

# User
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

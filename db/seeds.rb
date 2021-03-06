# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
 Category.delete_all
 ActiveRecord::Base.connection.execute("ALTER SEQUENCE categories_id_seq RESTART WITH 1;")
 Category.create!(:name => "Eggs and Dairy Products")
 Category.create!(:name => "Over-the-Counter Medications")
 Category.create!(:name => "Dry and Canned Goods")
 Category.create!(:name => "Meats")
 Category.create!(:name => "Drinks")
 Category.create!(:name => "Sweets and Snacks")
 Category.create!(:name => "Miscellaneous")

Status.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE statuses_id_seq RESTART WITH 1;")
Status.create!(:name => "Active")
Status.create!(:name => "Needs Replenishment")
Status.create!(:name => "Out of Stock")

User.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
User.create!(:email => "developer@admin.com", :password => "developer")

Sale.delete_all
Delivery.delete_all

Item.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE items_id_seq RESTART WITH 1;")
Item.create!(:name => "Bond Paper (S)", :category_id => "1", :cost_price => "5", :stock => "0", :status_id => "3", :critical_quantity_basis => "10")
Item.create!(:name => "Bond Paper (L)", :category_id => "1", :cost_price => "5", :stock => "0", :status_id => "3", :critical_quantity_basis => "10")
Item.create!(:name => "Glossy Paper", :category_id => "1", :cost_price => "10", :stock => "0", :status_id => "3", :critical_quantity_basis => "10")
Item.create!(:name => "Colored Paper", :category_id => "1", :cost_price => "10", :stock => "0", :status_id => "3", :critical_quantity_basis => "10")
Item.create!(:name => "Oslo", :category_id => "1", :cost_price => "5", :stock => "0", :status_id => "3", :critical_quantity_basis => "10")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 Category.delete_all
 ActiveRecord::Base.connection.execute("ALTER SEQUENCE categories_id_seq RESTART WITH 1;")
 Category.create(:name => "Eggs and Dairy Products")
 Category.create(:name => "Over-the-Counter Medications")
 Category.create(:name => "Dry and Canned Goods")
 Category.create(:name => "Meats")
 Category.create(:name => "Drinks")
 Category.create(:name => "Sweets and Snacks")
 Category.create(:name => "Miscellaneous")

Status.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE statuses_id_seq RESTART WITH 1;")
Status.create(:name => "Active")
Status.create(:name => "Needs Replenishment")
Status.create(:name => "Out of Stock")

Unit.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE units_id_seq RESTART WITH 1;")
Unit.create(:name => "cup")
Unit.create(:name => "oz")
Unit.create(:name => "gal")
Unit.create(:name => "lb")
Unit.create(:name => "pt")
Unit.create(:name => "qt")
Unit.create(:name => "tbl")
Unit.create(:name => "tsp")
Unit.create(:name => "dozen")
Unit.create(:name => "ea")
Unit.create(:name => "gr")
Unit.create(:name => "thous")
Unit.create(:name => "g")
Unit.create(:name => "kg")
Unit.create(:name => "l")
Unit.create(:name => "ml")
Unit.create(:name => "bag")
Unit.create(:name => "basket")
Unit.create(:name => "bottle")
Unit.create(:name => "box")
Unit.create(:name => "brick")
Unit.create(:name => "bucket")
Unit.create(:name => "bunch")
Unit.create(:name => "bushel")
Unit.create(:name => "can")
Unit.create(:name => "case")
Unit.create(:name => "clove")
Unit.create(:name => "container")

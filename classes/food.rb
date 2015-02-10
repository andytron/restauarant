class Food < ActiveRecord::Base

  has_many :meals
  has_many :parties, through: :meals

end

# CREATE TABLE foods (
# id SERIAL PRIMARY KEY,
# name TEXT NOT NULL,
# category TEXT NOT NULL,
# cuisine_type TEXT NOT NULL,
# price INT NOT NULL,
# vegetarian BOOLEAN NOT NULL,
# created_at timestamp NOT NULL,
# updated_at timestamp NOT NULL
# );

# INSERT INTO
#   foods (name, category, cuisine_type, price, vegetarian, created_at, updated_at)
# VALUES
#   ('Grilled Chicken Plate', 'Entrées', 'American', 10, false, '2015-02-04 16:36:46 -0500', '2015-02-04 16:36:46 -0500'),
#   ('Vegan Panini', 'Sandwiches', 'Italian', 8, true, '2015-02-04 16:37:42 -0500', '2015-02-04 16:37:42 -0500'),
#   ('Lobster Grilled Cheese Sandwich', 'Sandwiches', 'American', 11, false, '2015-02-04 16:39:18 -0500', '2015-02-04 16:39:18 -0500'),
#   ('Kale Salad', 'Salads', 'American', 9, true, '2015-02-04 16:48:18 -0500', '2015-02-04 16:48:18 -0500'),
#   ('Carne Asada Taco Plate', 'Tacos', 'Mexican', 8, false, '2015-02-04 16:58:26 -0500', '2015-02-04 16:58:26 -0500'),
#   ('Veggie Burger', 'Burgers', 'American', 8, true, '2015-02-04 16:59:19 -0500', '2015-02-04 16:59:19 -0500'),
#   ('Falafel Wrap', 'Wraps', 'Mediterranean', 9, true, '2015-02-04 17:00:14 -0500', '2015-02-04 17:00:14 -0500'),
#   ('Fish & Chips', 'Entrées', 'American', 12, false, '2015-02-04 17:01:03 -0500', '2015-02-04 17:01:03 -0500');
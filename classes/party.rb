class Party < ActiveRecord::Base
  
  has_many :meals
  has_many :foods, through: :meals

end

# CREATE TABLE parties (
# id SERIAL PRIMARY KEY,
# name TEXT NOT NULL,
# table_id INT NOT NULL,
# number_guests INT NOT NULL,
# meal_paid BOOLEAN NOT NULL,
# created_at timestamp NOT NULL,
# updated_at timestamp NOT NULL
# );

# INSERT INTO
#   parties (name, table_id, number_guests, meal_paid, created_at, updated_at)
# VALUES
#   ('Jim', 1, 2, false, '2015-02-04 16:28:53 -0500', '2015-02-04 16:31:46 -0500'),
#   ('Michael', 2, 4, false, '2015-02-04 16:29:22 -0500', '2015-02-04 16:33:02 -0500'),
#   ('Kelly', 3, 3, false, '2015-02-04 16:50:24 -0500', '2015-02-04 16:51:35 -0500'),
#   ('Dwight', 4, 1, false, '2015-02-04 16:51:00 -0500', '2015-02-04 16:55:20 -0500');
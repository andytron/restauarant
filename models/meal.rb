class Meal < ActiveRecord::Base

  belongs_to :party
  belongs_to :food

end

# CREATE TABLE meals (
# id SERIAL PRIMARY KEY,
# party_id INT NOT NULL,
# food_id INT NOT NULL,
# created_at timestamp NOT NULL,
# updated_at timestamp NOT NULL
# );

# INSERT INTO
#   meals (party_id, food_id, created_at, updated_at)
# VALUES
#   (1, 1),
#   (1, 3),
#   (2, 5),
#   (2, 7),
#   (2, 2),
#   (2, 4),
#   (3, 6),
#   (3, 8),
#   (3, 1),
#   (4, 2);
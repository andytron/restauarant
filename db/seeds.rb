require_relative '../environment'

def execute(sql)
  ActiveRecord::Base.connection.execute(sql)
end

# Create the database if it doesn't exist yet
system('createdb restaurant 2>/dev/null')

# Food Schema
execute <<-SQL
  DROP TABLE IF EXISTS foods;
  CREATE TABLE foods (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    cuisine_type TEXT NOT NULL,
    price INT NOT NULL,
    vegetarian BOOLEAN NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
  );
SQL

# Meal Schema
execute <<-SQL
  DROP TABLE IF EXISTS meals;
  CREATE TABLE meals (
    id SERIAL PRIMARY KEY,
    party_id INT NOT NULL,
    food_id INT NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
  );
SQL

# Party Schema
execute <<-SQL
  DROP TABLE IF EXISTS parties;
  CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    table_id INT NOT NULL,
    number_guests INT NOT NULL,
    meal_paid BOOLEAN NOT NULL,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
  );
SQL

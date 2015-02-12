require_relative 'environment'
require_relative 'old_app.rb'

map('/foods') { run FoodsController }
map('/parties') { run PartiesController }
map('/meals') { run MealsController }
run Sinatra::Application
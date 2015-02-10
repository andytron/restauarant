if ENV['APP_ENV'] == 'production'
  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "restaurants"
  )
else
  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "restaurants",
    host: "localhost"
  )
end

require_relative 'classes/party'
require_relative 'classes/food'
require_relative 'classes/meal'

enable :method_override

# default route
get '/' do
  erb :index
end

# -------- FOOD -------- #

# index: Display all the food items
get '/foods' do
  @foods = Food.all

  erb :'foods/index'
end

# new: Return a new form for a new food item
get '/foods/new' do
  erb :'foods/new'
end

# create: Create a new food item
post '/foods' do
  food = Food.create(params[:food])

  redirect to "/foods/#{food.id}"
end

# edit: Return a form for editing a food item
get '/foods/:id/edit' do
  @food = Food.find(params['id'])

  erb :'/foods/edit'
end

# update: Update a party
patch '/foods/:id' do
  food = Food.find(params[:id])
  food.update(params[:food])

  redirect to "/foods/#{food.id}"
end

# show: Display a single party
get '/foods/:id' do
  food_id = params['id']
  @food = Food.find(food_id)

  erb :'/foods/show'
end

# destroy: Delete/Cancel a food item
delete '/foods/:id' do
  Food.delete(params[:id])

  redirect to "/foods"
end

# -------- PARTY -------- #

# index: Display all the parties
get '/parties' do
  @parties = Party.all

  erb :'parties/index'
end

# new: Return a form a new party
get '/parties/new' do
  erb :'parties/new'
end

# create: Create a new party
post '/parties' do
  party = Party.create(params[:party])

  redirect to "/parties/#{party.id}"
end

# edit: Return a form for editing a new party
get '/parties/:id/edit' do
  @party = Party.find(params['id'])
  # @foods = Food.all

  erb :'parties/edit'
end

# update: Update a party
patch '/parties/:id' do
  party = Party.find(params[:id])
  party.update(params[:party])

  redirect to "/parties/#{party.id}"
end

# show: Display a single party
get '/parties/:id' do
  party_id = params['id']
  @party = Party.find(party_id)
  @foods = Food.all
  @party_order = @party.foods

  erb :'parties/show'
end

# destroy: Delete/Cancel a party
delete '/parties/:id' do
  Party.delete(params[:id])

  redirect to "/parties"
end

# -------- MEAL -------- #

# get '/meals/:id/meal' do |id|
#   @party = Party.find(id)
#   @meals = @party.foods
#   # @meals = Meal.find(params['id'])
#   @foods = Food.all

#   erb :'party/meal'
# end

post '/parties/:id/meals' do
  meal = Meal.create(params[:meal])
  party = Party.find(params[:id])

  redirect to "/parties/#{party.id}"
end

patch '/parties/:id/meals' do
  meal = Meal.find(params[:id])
  meal.update(params[:meal])

  redirect to "/parties/#{party.id}"
end

delete '/meals/:id' do
  @meal = Meal.find(params[:id])
  @meal.destroy

  redirect to "/parties/#{@meal.party_id}"
end

# delete '/meals/:id/meals' do
#   meal = Meal.find(params[:id])
#   meal.destroy

#   redirect to "/parties/"
# end

# -------- CHECKOUT -------- #

# save party's receipt, display contents of receipt, and offer receipt for download
get '/parties/:id/receipt' do
  @meal = Meal.find(params['id'])

  party_id = params['id']
  @party = Party.find(party_id)
  @party.update(meal_paid: true)
  @foods = Food.all
  @party_order = @party.foods

  erb :'parties/receipt'
  # redirect to "/parties/#{@meal.party_id}/receipt"
end

# checkout the party, mark them as paid
# get 'parties/:id/checkout' do
#   @meal = Meal.find(params['id'].to_i)

#   erb :'parties/checkout'
# end

# run Pry
get '/console' do
  Pry.start(binding)

end

class PartiesController < ApplicationController

  # index: Display all the parties
    get '/' do
    @parties = Party.all

    erb :'parties/index'
  end

  # new: Return a form a new party
  get '/new' do
    erb :'parties/new'
  end

  # create: Create a new party
  post '/' do
    party = Party.create(params[:party])

    redirect to "/#{party.id}"
  end

  # edit: Return a form for editing a new party
  get '/:id/edit' do
    @party = Party.find(params['id'])
    # @foods = Food.all

    erb :'parties/edit'
  end

  # update: Update a party
  patch '/:id' do
    party = Party.find(params[:id])
    party.update(params[:party])

    redirect to "/#{party.id}"
  end

  # show: Display a single party
  get '/:id' do
    party_id = params['id']
    @party = Party.find(party_id)
    @foods = Food.all
    @party_order = @party.foods

    erb :'parties/show'
  end

  # destroy: Delete/Cancel a party
  delete '/:id' do
    Party.delete(params[:id])

    redirect to "/"
  end

  # -------- MEAL -------- #

  post '/:id/meals' do
    meal = Meal.create(params[:meal])
    party = Party.find(params[:id])

    redirect to "//#{party.id}"
  end

  patch '/:id/meals' do
    meal = Meal.find(params[:id])
    meal.update(params[:meal])

    redirect to "/#{party.id}"
  end

  # -------- CHECKOUT -------- #

  get '/:id/receipt' do
    @meal = Meal.find(params['id'])

    party_id = params['id']
    @party = Party.find(party_id)
    @party.update(meal_paid: true)
    @foods = Food.all
    @party_order = @party.foods

    erb :'parties/receipt'
  end

end
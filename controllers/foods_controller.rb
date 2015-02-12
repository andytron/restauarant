class FoodsController < ApplicationController

  # index: Display all the food items
  get '/' do
    @foods = Food.all

    erb :'foods/index'
  end

  # new: Return a new form for a new food item
  get '/new' do
    erb :'foods/new'
  end

  # create: Create a new food item
  post '/' do
    food = Food.create(params[:food])

    redirect to "/#{food.id}"
  end

  # edit: Return a form for editing a food item
  get '/:id/edit' do
    @food = Food.find(params['id'])

    erb :'foods/edit'
  end

  # update: Update a food item
  patch '/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])

    redirect to "/#{food.id}"
  end

  # show: Display a food item
  get '/:id' do
    food_id = params['id']
    @food = Food.find(food_id)

    erb :'foods/show'
  end

  # destroy: Delete/Cancel a food item
  delete '/:id' do
    Food.delete(params[:id])

    redirect to "/"
  end

end
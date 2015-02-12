class MealsController < ApplicationController
 
  delete '/:id' do
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect to "/parties/#{@meal.party_id}"
  end

end
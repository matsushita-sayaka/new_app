class IngredientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @ingredient = Ingredient.new
    @recipes = Recipe.where(menu_title: "2018年11月1週目")
  end
  
  def create
    params[:ingredient].each do |ingredient|
      logger.debug("--------------------- 友達　#{ingredient}")
      if check_box == 1
        current_user.ingredients.create!(recipe_id: ingredient[:recipe_id], check_box: ingredient[:check_box])
      else
        current_user.ingredients.create!(recipe_id: ingredient[:recipe_id], check_box: 5)
      end
    end
    redirect_to user_path(current_user)
  end
 
  def destroy
    current_user.ingredients.where(recipe_id: 1..64).destroy_all
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:user_id, check_box:[], recipe_id:[] )
  end
  
end
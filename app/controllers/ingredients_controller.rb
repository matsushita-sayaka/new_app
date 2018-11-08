class IngredientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @ingredient = Ingredient.new
    @recipes = Recipe.where(menu_title: "2018年11月1週目")
  end
  
  def create
    params[:ingredient].each do |ingredient|
      logger.debug("--------------------- 友達　#{ingredient}")
      current_user.ingredients.create!(recipe_id: ingredient[:recipe_id], check_box: ingredient[:check_box])
    end
    redirect_to user_path(current_user)
  end
 
  def destroy
    current_user.ingredients.where(recipe_id: 1..64).destroy_all
    redirect_to :back
  end
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:user_id, check_box:[], recipe_id:[] )
  end
  
end
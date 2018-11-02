class IngredientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @ingredient = Ingredient.new
    @recipes = Recipe.where(menu_title: "2018年11月1週目")
  end
  
  def show
    @ingredients = Ingredient.all 
  end
  
  def create
    @ingredient = current_user.ingredients.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render ingredients_path
    end
    
  end
  
  def destroy
  end
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:user_id, :check_box, :recipe_id)
  end
end
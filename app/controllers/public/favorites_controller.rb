class Public::FavoritesController < ApplicationController


  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_public_user.favorites.new(recipe_id: recipe.id)
    favorite.save
    redirect_to public_recipe_path(recipe) end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_public_user.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    redirect_to public_recipe_path(recipe)  end

    private

    def recipe_params
      params.require(:favorite).permit(:user_id, :recipe_id)
    end
end

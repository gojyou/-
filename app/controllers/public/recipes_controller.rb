class Public::RecipesController < ApplicationController
  def show
   @recipe=Recipe.find(params[:id])
   @store = @recipe.store
  end

  def index
    favorites = Favorite.where(user_id: current_public_user.id).pluck(:recipe_id)
    @recipes = Recipe.find(favorites)
    @recipes =  Kaminari.paginate_array(@recipes).page(params[:page]).per(2)
  end

  def stores_recipe
    @recipes=Recipe.where(store_id:params[:store_id])
  end

  def search
    if params[:cooking_name].present?
      store = Store.find_by(genre: params[:cooking_name])
      if store
        store_recipes = store.recipes
      else
        store = Store.find_by(area: params[:cooking_name])
        if store
          store_recipes = store.recipes
        else
          store = Store.find_by(station: params[:cooking_name])
          if store
            store_recipes = store.recipes
          else
            store_recipes = []
          end
        end
      end
      @recipes = Recipe.where(' cooking_name LIKE ?', "%#{params[:cooking_name]}%").to_a + store_recipes.to_a
    else
      @recipes = Recipe.none
    end
  end


   private

    def recipe_params
      params.require(:recipe).permit(:store_id, :cooking_name, :recipe, :amount, :image)
    end

end
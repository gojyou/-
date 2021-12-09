class  Admin::RecipesController < ApplicationController

  def new
    @recipe= Recipe.new
  end

  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.store_id=current_admin_store.id
    if @recipe.save
      redirect_to admin_recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe=Recipe.find(params[:id])
  end

  def edit
    @recipe=Recipe.find(params[:id])
    @store=current_admin_store
  end

  def update
     @recipe=Recipe.find(params[:id])
     @recipe.update(recipe_params)
     redirect_to  admin_recipe_path(@recipe)
  end

  def index

    @recipe=Recipe.new
    @recipes=current_admin_store.recipes.page(params[:page]).reverse_order

  end

  def destroy
    @recipe=Recipe.find(params[:id])
    @recipe.destroy
    redirect_to admin_recipes_path
  end

   private

    def recipe_params
      params.require(:recipe).permit( :cooking_name, :recipe, :amount, :image)
    end


end

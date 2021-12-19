class HomesController < ApplicationController
  def top
    @recipes=Recipe.all.page(params[:page]).reverse_order
    @genre = Store.group(:genre).pluck(:genre).sort
    @area = Store.group(:area).pluck(:area).sort
    @station = Store.group(:station).pluck(:station).sort


  end

  def rank
    # binding.irb
    favorite_ids = Favorite.group(:recipe_id).order(Arel.sql('count(recipe_id) desc')).limit(10).pluck(:recipe_id)
    @recipe_favorite_ranks = Recipe.find(favorite_ids)
  end
end

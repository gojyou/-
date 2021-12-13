class Public::RecipeCommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = recipe.recipe_comments.new(recipe_comment_params)
    comment.recipe_id = recipe.id
    comment.user_id = current_public_user.id
    comment.save!
    redirect_to public_recipe_path(recipe.id)
  end

  def destroy
    RecipeComment.find_by(id: params[:id]).destroy
    redirect_to public_recipe_path(params[:recipe_id])
  end

   private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end

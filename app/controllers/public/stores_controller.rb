class Public::StoresController < ApplicationController
  def show
    # @recipe=Recipe.find(params[:id])
    @store = Store.find(params[:id])
  end
end

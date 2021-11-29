class  Admin::StoresController < ApplicationController

  def create
    store=Store.new(store_params)
    store.save
    sign_in store
    #sign_in Store.find_by(email: "k@k")
    redirect_to admin_stores_path
  end

  def edit
    @store=current_admin_store
  end

  def update

    @store=current_admin_store
    @store.update(store_params)
    redirect_to  admin_stores_path
  end

  def show
    @store=current_admin_store
  end

  def destroy
    @store=current_admin_store
    @store.destroy
    redirect_to root_path
  end


  private

    def store_params
      params.require(:store).permit(:name, :genre, :area, :station, :url, :phrase, :image, :email, :password, :password_confirmation)
    end

end

class PetsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      flash[:success] = "ペットを登録しました。"
      redirect_to @pet
    else
      render 'new'
    end
  end

  def show
    set_pet
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      flash[:success] = "ペット情報を更新しました。"
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def destroy
    @pet.destroy
    flash[:success] = "ペットを削除しました。"
    redirect_to request.referrer || root_url
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :other_breed, :gender,
                                  :birthday, :weight, :length, :introduce)
    end

    def set_pet
      @pet = Pet.find(params[:id])
    end

    def correct_user
      @pet = current_user.pets.find_by(id: params[:id])
      redirect_to root_url if @pet.nil?
    end
end

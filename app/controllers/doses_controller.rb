class DosesController < ApplicationController
  before_action :find_cocktail, only: [:index, :show, :create, :destroy, :new]

  def index
    @doses = Dose.where(cocktail_id: @cocktail.id)
  end

  def show
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.create(description: dose_params["description"], ingredient_id: dose_params["ingredient_id"], cocktail_id: @cocktail.id)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
  end

  def find
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @entities = Entity.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  def create
    @category = current_user.categories.new(category_params)
    @category.user = User.find(params[:user_id])
    if @category.save
      flash[:notice] = 'Category saved successfullt'
    else
      flash[:alert] = 'Category not saved'
    end
    redirect_to user_categories_path
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    Entity.where(category_id: @category.id).destroy_all
    @category.destroy
    if @category.destroy
      flash[:notice] = 'Category removed successfully'
    else
      flash[:alert] = 'Category not removed'
    end
    redirect_to user_categories_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

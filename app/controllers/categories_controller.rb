class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
  end
  
  def show
    @categories = Category.find(params[:id])
    @entities = Entity.where(group_id: @category.id)
  end
  
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    @category.user_id = current_user.id

    respond_to do|format|
      if @category.save
        format.html { redirect_to user_group_url(current_user, @category), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(group_params)
        format.html { redirect_to group_url(@category), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Entity.where(group_id: @category.id).destroy_all
    @group.destroy

    respond_to do |format|
      format.html { redirect_to user_groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @Category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
